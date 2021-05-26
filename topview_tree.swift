import Foundation

//Top View of a binary tree


class Node {
    var data:Int
    var left:Node?
    var right:Node?
    var distanceValue:Int = 0
    var level:Int = 0
    init(data:Int) {
        self.data = data
    }
}

extension Node:CustomStringConvertible {
    var description: String {
        let s =  "data - \(data) "
        return s
//        if let left = left {
//            s += "left -> \(left.data) "
//        }
//
//        if let right = right {
//            s += "right -> \(right.data) "
//        }
//
//        s += "distanceValue - \(distanceValue) "
//        s += "level - \(level) "
//        return s
    }
}

class Queue {
    private(set) var list:[Node] = []
    
    func enqueue(_ x:Node) {
        list.append(x)
    }
    
    @discardableResult func dequeue() -> Node? {
        guard list.isEmpty == false else {return nil}
        let x = list[0]
        list.remove(at:0)
        return x
    }
}


class BinaryTree {
    var levelBounds:[Int:(Int,Int)] = [:]
    var root:Node?

    
    func insert(_ x:Int) {
        guard let root = root else {
            self.root = Node(data:x)
            return
        }
        
        print()
        root.level = 0
        root.distanceValue = 0
        levelBounds[0] = (0,0)
        let queue = Queue()
        queue.enqueue(root)
        insertUtil(x, queue:queue)
        print(levelBounds)
        
    }
    
    func insertUtil(_ x:Int,  queue:Queue)  {
        while let node = queue.dequeue() {
            print("Looking at \(node) for \(x)")
            
            
        
            // Left
            if let left = node.left {
                left.level = node.level + 1
                left.distanceValue = node.distanceValue + 1
                print("[L] Add \(left.data) to the queue")
                queue.enqueue(left)
                
                if let (l,r) = levelBounds[node.level+1] {
                    if left.distanceValue > l {
                        levelBounds[node.level+1] = (left.distanceValue, r)
                    }
                    
                } else {
                    levelBounds[node.level+1] = (left.distanceValue, 0)
                }
                
            } else {
                // Insert here
                print("Insert \(x) to the left of \(node)")
                node.left = Node(data:x)
                node.left?.level = node.level + 1
                node.left?.distanceValue = node.distanceValue + 1
                
                if let (l,r) = levelBounds[node.level+1] {
                    if node.distanceValue+1 > l {
                        levelBounds[node.level+1] = (node.distanceValue+1, r)
                    }
                    
                } else {
                    levelBounds[node.level+1] = (node.distanceValue+1, 0)
                }
                
                return
            }
            
            
            // Right
            if let right = node.right {
                print("[R] Add \(right.data) to the queue")
                right.level = node.level + 1
                right.distanceValue = node.distanceValue - 1
                queue.enqueue(right)
                
                if let (l,r) = levelBounds[node.level+1] {
                    if right.distanceValue < r {
                        levelBounds[node.level+1] = (l, right.distanceValue)
                    }
                    
                } else {
                    levelBounds[node.level+1] = (0, right.distanceValue)
                }
                
            } else {
                print("Insert \(x) to the right of \(node)")
                let newNode = Node(data:x)
                node.right = newNode
                newNode.level = node.level + 1
                newNode.distanceValue = node.distanceValue - 1
                
                
                if let (l,r) = levelBounds[node.level+1] {
                    if newNode.distanceValue < r {
                        levelBounds[node.level+1] = (l, newNode.distanceValue)
                    }
                    
                } else {
                    levelBounds[node.level+1] = (0, newNode.distanceValue)
                }
                return
            }
        }
    }
    
    func topView(_ root:Node?) {
        guard let root = root else {return}
        topView(root.left)
        if let (l,r) = levelBounds[root.level] {
//            print("l : \(l) r : \(r) level:\(root.level) dvalue : \(root.distanceValue)")
            if root.distanceValue >= l || root.distanceValue <= r {
                print("\(root.data)")
            }
         }
        
//        print(root)
        topView(root.right)
        
    }
}


let tree = BinaryTree()
let input = [1,2,3,4,5,6,8]

for i in input {
    tree.insert(i)
}

tree.topView(tree.root)


