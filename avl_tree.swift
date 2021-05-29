import Foundation

class Node {
    var data:Int
    var left:Node?
    var right:Node?
    var height:Int = 0
    
    var balance:Int {
        let leftHeight = left?.height ?? -1
        let rightHeight = right?.height ?? -1
        return leftHeight - rightHeight
    }
    
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



class AVLTree {
    var root:Node?
    
    func calculateHeight(root:Node?) -> Int {
        guard let root = root else {return -1}
        return max(calculateHeight(root: root.left), calculateHeight(root: root.right)) + 1
    }
    
    func getMinimum(root:Node?) -> Node? {
        guard let root = root else {return nil}
        var min = root
        while let q = root.left {
            min = q
        }
        return min
    }
    
    func insert(_ x:Int) {
        root = insertUtil(root, x)
    }
    
    private func insertUtil(_ root:Node?, _ x:Int) -> Node? {
        guard let root = root else {
            return Node(data:x)
        }
        
        if x < root.data {
            // Go Left
            root.left = insertUtil(root.left, x)
        } else if x > root.data {
            // Go right
            root.right = insertUtil(root.right, x)
        } else {
            return root
        }
        
        updateHeight(root:root)
        
        // Rebalance here
        return rotateIfNeeded(x: root, data: x)
        
    }
    
    func delete(_ x:Int) {
        root =  deleteUtil(root, x)
    }
    
    func updateHeight(root:Node) {
        root.height = calculateHeight(root: root)
    }
    
    func deleteUtil(_ root:Node?, _ x:Int) -> Node? {
        guard let root = root else {return root}
        
        if x < root.data {
            // Go left
            root.left = deleteUtil(root.left, x)
        } else if x > root.data {
            root.right = deleteUtil(root.right, x)
        } else {
            // Delete this node
            if root.left == nil || root.right == nil {
                if root.left == nil {
                    return root.left
                } else {
                    return root.right
                }
            }
            
            let successor = getMinimum(root: root.right)!
            root.data = successor.data
            root.right = deleteUtil(root.right, successor.data)

            updateHeight(root:root)
            
        }
        return rotateIfNeeded(x: root, data: x)
    }
    
    func rotateIfNeeded(x:Node?, data:Int) -> Node? {
        guard let x = x, abs(x.balance) > 1  else {return x }
        
        if let left = x.left, x.balance > 1 {
            if data < left.data {
                // Left Left
                return rightRotate(x)
            } else {
                // Left Right
                x.left = leftRotate(x.left)
                return rightRotate(x)
            }
            
        } else if let right = x.right {
            if data < right.data {
                // Right Left
                x.right = rightRotate(x.right)
                return leftRotate(x)
            } else {
                // Right Right
                return leftRotate(x)
            }
        }
        return x
    }
    
    public func rightRotate(_ x:Node?) -> Node? {
        guard let x = x, let y = x.left else {return nil }
        print("Rotating right on \(x.data)")
        let T1 = y.right
        y.right = x
        x.left = T1
        
        x.height = calculateHeight(root: x)
        y.height = calculateHeight(root: y)
        return y
        
    }
    
    public func leftRotate(_ x:Node?) -> Node? {
        guard let x = x, let y = x.right else {return nil }
        print("Rotating left on \(x.data)")
        let T1 = y.left
        y.left = x
        x.right = T1
        
        x.height = calculateHeight(root: x)
        y.height = calculateHeight(root: y)
        return y
        
    }
    
    public func inorder() {
        inorderUtil(root: root)
        print("")
    }
    
    private func inorderUtil(root:Node?) {
        guard let root = root else {return }
        inorderUtil(root: root.left)
        print("\(root.data)", terminator:" -> ")
        inorderUtil(root: root.right)
        
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
    
    func getDepth() -> Int {
           guard let root = root else {
               return -1
           }
           return calculateDepth(root: root, level:0)
       }
       
       private func calculateDepth(root:Node?, level:Int) -> Int {
           guard let root = root else {return level-1}
//           print("Node \(root.data) has depth \(level) ")
        print("Node \(root.data) has balance \(root.balance) ")
        
           return max(calculateDepth(root: root.left, level: level+1),calculateDepth(root: root.right, level: level+1))
       }
       
}


let tree = AVLTree()
let input = [10,20,30,40,50,60,50,60,70,80,90,100].reversed()
for i in input {
    tree.insert(i)
}
tree.inorder()
print("Balance : \(tree.root!.balance)")
tree.bfs()
print(tree.getDepth())

