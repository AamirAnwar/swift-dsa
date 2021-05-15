import UIKit

class BinarySearchTree<T:Comparable> {
    
    private(set) public var value:T
    private(set) public var parent:BinarySearchTree?
    private(set) public var left:BinarySearchTree?
    private(set) public var right:BinarySearchTree?
    
    init(withValue value:T) {
        self.value = value
    }
    
    public var hasLeftChild:Bool {
        return left != nil
    }
    
    public var hasRightChild:Bool {
        return right != nil
    }
    
    public var hasAnyChild:Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren:Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var isLeftChild:Bool {
        return parent?.left === self
    }
    
    public var isRightChild:Bool {
        return parent?.right === self
    }
    
    public var hasParent:Bool {
        return parent != nil
    }

    public var isLeaf: Bool {
        return hasAnyChild == false
    }
    
    public var isRoot:Bool {
        return hasParent == false
    }
    
    
    // Time complexity - O(h) where h is the height of the tree (worst case is O(n))
    func search(_ x:T) -> BinarySearchTree? {
        if value == x {
            return self
        }
        
        if value < x {
            // Go right
            return right?.search(x)
        } else if value > x {
            // Go left
            return left?.search(x)
        }
        return nil
    }
    
    // Time complexity - O(h) where h is the height of the tree (worst case is O(n))
    func insert(_ x:T) {
        
        if x > self.value {
            // Go right
            if let right = right {
                right.insert(x)
            } else {
                right = BinarySearchTree<T>.init(withValue:x)
                right?.parent = self
            }
        } else if x < self.value {
            // Go left
            if let left = left {
                left.insert(x)
            } else {
                left = BinarySearchTree<T>.init(withValue: x)
                left?.parent = self
            }
            
        } else {
            print("[error] Value already exists in the tree")
        }
    }
    
    func inorder() {
        left?.inorder()
        print(self.value, terminator: "")
        right?.inorder()
    }
    
    func debug() {
        print("Debug log for node \(self.value)")
        print("parent node - \(parent?.value)")
        print("left child - \(left?.value)")
        print("right child - \(right?.value)")
        left?.debug()
        right?.debug()
    }
    
    
    func delete(_ x:T) {
        guard let node = search(x) else {
            print("[error] \(x) does not exist in the tree")
            return
        }
        print("[info] Deleting \(node.value)")
        
        
        if node.isLeaf {
            print("[info] this node is a leaf node")
            if node.isLeftChild {
//                print("[info] this node is the left child")
                node.parent?.left = nil
            } else {
//                print("[info] this node is the right child")
                node.parent?.right = nil
            }
            node.parent = nil
            
        } else {
            if node.hasBothChildren {
                print("[info] this node has two children")
                let successor = node.getInorderSuccessor()!
                node.value = successor.value
                node.right?.delete(successor.value)
            } else {
                // Single Child
                print("[info] this node has one child")
                if node.hasLeftChild {
                    print("[info] this node has left child")
                    node.left?.parent = node.parent
                    if node.isRightChild {
                        node.parent?.right = node.left
                    } else if node.isLeftChild {
                        node.parent?.left = node.left
                    }
                    node.left = nil
                } else {
                    print("[info] this node has right child")
                    // Has to have right child
                    node.right?.parent = node.parent
                    if node.isRightChild {
                        node.parent?.right = node.right
                    } else if node.isLeftChild {
                        node.parent?.left = node.right
                    }
                    node.right = nil
                }
            }
        }
    }
    
    func getInorderSuccessor() -> BinarySearchTree? {
        guard let node = self.right else {
            return nil
        }
        
        var p = node
        
        while p.left != nil {
            p = p.left!
        }
        return p
    }
}


let tree = BinarySearchTree<Int>(withValue: 5)
let input:[Int] = [3,7,2,4,6,8]

for i in input {
    tree.insert(i)
    tree.inorder()
    print("")
}

for i in 0..<5 {
    print("Does \(i) exist? - \(tree.search(i) != nil)")
    tree.delete(i)

}

for i in 6..<10 {
    print("Does \(i) exist? - \(tree.search(i) != nil)")
    tree.delete(i)

}

tree.inorder()
print("")

tree.debug()
print("")







