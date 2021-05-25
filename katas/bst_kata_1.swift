import Foundation

class Node {
    var data:Int
    var left:Node?
    var right:Node?
    
    init(data:Int) {
        self.data = data
    }
}

extension Node:Hashable {
    static func ==(lhs:Node, rhs:Node) -> Bool {
        return lhs.data == rhs.data
    }
    
    func hash(into hasher:inout Hasher) {
        hasher.combine(data)
    }
}

class Queue {
    private(set) var list:[Node] = []
    
    func enqueue(_ x:Node) {
        list.append(x)
    }
    
    func dequeue() -> Node? {
        guard list.isEmpty == false else {return nil}
        let x = list[0]
        list.remove(at:0)
        return x
    }
}


class BST {
    var root:Node?
    var isEmpty:Bool {
        return root == nil
    }
    
    
    private func insertUtil(root:Node? ,_ x:Int) -> Node? {
        guard let root = root else {
            return Node(data:x)
        }
        if x < root.data {
            // Go left
            root.left = insertUtil(root:root.left, x)
        } else if x > root.data {
            // Go right
            root.right = insertUtil(root:root.right, x)
        }
        return root
    }
    
    func insert(_ x:Int) {
        self.root = insertUtil(root:self.root, x)
    }
    
    
    private func deleteUtil(root:Node?, _ x:Int) -> Node? {
        guard let root = root else {
            return nil
        }
        
        if x < root.data {
            root.left = deleteUtil(root: root.left, x)
        } else if x > root.data {
            root.right = deleteUtil(root: root.right, x)
        } else {
            if root.left == nil || root.right == nil {
                if root.left == nil {
                    return root.right
                } else {
                    return root.left
                }
            } else {
                // Delete this node with two children
                let successor = findInorderSuccessor(root: root.right)!
                root.data = successor.data
                root.right = deleteUtil(root:root.right, successor.data)
            }
            
        }
        return root
    }
    
    func getHeight() -> Int {
        return calculateHeight(root:root)
    }
    
    private func calculateHeight(root:Node?) -> Int {
        guard let root = root else {return -1}
        return max(calculateHeight(root: root.left), calculateHeight(root: root.right)) + 1
        
    }
    
    func getDepth() -> Int {
        guard let root = root else {
            return -1
        }
        return calculateDepth(root: root, level:0)
    }
    
    private func calculateDepth(root:Node?, level:Int) -> Int {
        guard let root = root else {return level-1}
        print("Node \(root.data) has depth \(level) ")
        return max(calculateDepth(root: root.left, level: level+1),calculateDepth(root: root.right, level: level+1))
    }
    
    func findInorderSuccessor(root:Node?) -> Node? {
        guard let root = root else {
            return root
        }
        
        var p = root
        while let q = p.left {
            p = q
        }
        return p
    }
    
    func delete(_ x:Int) {
        print("[info] deleting \(x)")
        self.root = deleteUtil(root: root, x)
    }
    
    func preorder() {
        _preorder(root)
        print("")
    }
    
    func inorder() {
        _inorder(root)
        print("")
    }
    
    func postorder() {
        _postorder(root)
        print("")
    }
    
    private func _inorder(_ root:Node?) {
        guard let root = root else {
            return
        }
        _inorder(root.left)
        print(root.data, terminator:" -> ")
        _inorder(root.right)
    }
    
    private func _postorder(_ root:Node?) {
        guard let root = root else {
            return
        }
        _inorder(root.left)
        _inorder(root.right)
        print(root.data, terminator:" -> ")
    }
    
    private func _preorder(_ root:Node?) {
        guard let root = root else {
            return
        }
        print(root.data, terminator:" -> ")
        _inorder(root.left)
        _inorder(root.right)
        
    }
    
    // Level order traversal
    func bfs() {
        guard let root = root else {return}
        var discovered = Set<Node>()
        var processed = Set<Node>()
        let queue = Queue()
        
        queue.enqueue(root)
        
        bfsUtil(discovered:&discovered, processed:&processed, queue:queue)
    }
    
    private func bfsUtil(discovered:inout Set<Node>, processed: inout Set<Node>, queue:Queue) {
        
        while let node = queue.dequeue() {
            var nodes:[Node] = []
            
            if let left = node.left {
                nodes.append(left)
            }
            
            if let right = node.right {
                nodes.append(right)
            }
            
            for n in nodes {
                if  processed.contains(n) == false && discovered.contains(n) == false {
                    discovered.insert(n)
                    queue.enqueue(n)
                }
            }
            processed.insert(node)
            print("Processed \(node.data)")
            
        }
    }
}



let tree = BST()
let input = [50,30,70,20,40,60,90]

for i in input {
    tree.insert(i)
}

tree.inorder()
tree.bfs()

print(tree.getHeight())

print(tree.getDepth())




