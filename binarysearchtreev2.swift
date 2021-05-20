import Foundation

class Node {
    var data:Int
    var left:Node?
    var right:Node?
    
    var isLeaf:Bool {
        return left == nil && right == nil
    }
    
    var hasSingleChild:Bool {
        return ((left != nil && right == nil) || (right != nil && left == nil))
    }
    
    var hasBothChildren: Bool {
        return (left != nil) && (right != nil)
    }
    
    func isParentOf(_ x:Int) -> Bool {
        print("checking parent \(self.data)")
        
        if let left = left, left.data == x {
            print("\(self.data) is the parent of \(x) which is it's left child")
            return true
        }
        
        if let right = right ,right.data == x {
            print("\(self.data) is the parent of \(x) which is it's right child")
            return true
        }
        print("\(self.data) is NOT the parent of \(x)")
        return false
    }
    
    init(data:Int) {
        self.data = data
    }
}

extension Node: CustomStringConvertible {
    var description:String {
        var rows = [String]()
        
        rows.append("Value : \(self.data)")
        if let left = left {
            rows.append("Left Child : \(left.data)")
        }
        if let right = right {
            rows.append("Right Child : \(right.data)")
        }
        
        return rows.joined(separator:"\n")
    }
    
}


class BST {
    var root:Node?
    var isEmpty:Bool {
        return root == nil
    }
    
    public func insert(_ x:Int)  {
        self.root = _insert(root: self.root, x: x)
    }
    
    public func _insert(root:Node? ,x:Int) -> Node? {
        // Handle case for an empty tree
        guard let root = root else {
            return Node(data:x)
        }
        
        if x == root.data {
            print("[error] Value already exists in the binary search tree")
            return root
        }
        
        if x > root.data {
            root.right = _insert(root:root.right, x:x)
        } else {
            root.left = _insert(root:root.left, x:x)
        }
        return root
    }
    
    private func _search(_ root:Node?, _ x:Int) -> Node? {
        guard let root = root else {
            return nil
        }
        
        if root.data == x {
            // Found the node
            return root
        } else if root.data > x {
            // Go left
            return _search(root.left, x)
        }
        
        // Go right
        return _search(root.right,x)
    }
    
    
    public func search(_ x:Int) -> Node? {
        return _search(self.root, x)
        
    }
    
    public func inorder(root:Node?) {
        guard let root = root else {return}
        inorder(root:root.left)
        print("\(root.data)", terminator:" -> ")
//                print(root)
        inorder(root:root.right)
    }
    
    public func delete(_ root:Node?, _ x:Int) -> Node? {
        guard let root = root else {
            return nil
        }
        
        
        if root.data > x {
            // Go left
            root.left = delete(root.left, x)
        } else if root.data < x {
            // Go right
            root.right = delete(root.right, x)
        } else {
            // Delete this node
            
            if root.hasBothChildren {
                if let successor = findInorderSuccessor(root.right) {
                    root.data = successor.data
                    root.right = delete(root.right, successor.data)
                }
            } else {
                if let left = root.left {
                    return left
                } else if let right = root.right {
                    return right
                } else {
                    return nil
                }
                
            }
        }
        return root
    }
    public func findInorderSuccessor(_ root:Node?) -> Node? {
        guard let root = root else {return nil}
        var p = root
        while p.left != nil  {
            p = p.left!
        }
        return p
    }

}




let tree = BST()
let input = [50,20,70,10,30,80,60]
for x in input {
    tree.insert(x)
    
}

tree.delete(tree.root, 50)
tree.inorder(root:tree.root)
print("")





