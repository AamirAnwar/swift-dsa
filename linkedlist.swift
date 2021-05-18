import Foundation

class Node {
    var data:Int
    var next:Node?
    init(withData data:Int) {
        self.data = data
    }
}

class LinkedList {
    var head:Node?
   
    var isEmpty:Bool {
        return head == nil
    }
    
    init(withData data:Int) {
        self.head = Node(withData:data)
    }
    
    // O(n)
    func search(_ x:Int) -> Int {
        var p = head
        var index = 0
        while p != nil {
            let node = p!
            if node.data == x {
                return index
            }
            p = node.next
            index += 1
        }
        
        return -1
    }
    
    // O(n)
    func insert(_ x:Int, at pos:Int) {
        guard pos >= 0 else {return}
        let node = Node(withData:x)
        if pos == 0 {
            node.next = head
            head = node
        } else {
            var p = head
            let predecessorPosition = pos - 1 // pos is atleast 1
            var i = 0
            while i < predecessorPosition && p != nil {
                p = p?.next
                i += 1
            }
            if p == nil {
                print("[error] position out of bounds")
            } else if i == predecessorPosition, let p = p {
                node.next = p.next
                p.next = node
            }
        }
    }
    
    func append(_ x:Int) {
        guard var p = head else {
            head = Node(withData:x)
            return
        }
        while let q = p.next {
            p = q
        }
        p.next = Node.init(withData:x)
    }
    
    // O(n)
    func delete(_ x:Int) {
        guard isEmpty == false else {
            print("[error] list is empty")
            return
        }
        var p:Node? = head
        var nodeToDelete:Node? = nil
        
        if let p = p, p.data == x {
            head = p.next
        }
        
        while let q = p?.next {
            if q.data == x {
                // Delete the node in front of p
                nodeToDelete = q
                break
            }
            p = p?.next
        }
        if let p = p, let nodeToDelete = nodeToDelete {
            p.next = nodeToDelete.next
            nodeToDelete.next = nil
        }
    }
}


extension LinkedList:CustomStringConvertible {
    var description: String {
        var p:Node? = head
        while p != nil {
            let node = p!
            print(node.data, terminator:" -> ")
            p = node.next
            
        }
        return "NULL"
    }
    
}

// 1,2,3,4,5
let list = LinkedList(withData: 1)
for i in 2...5 {
    list.append(i)
}
list.insert(12, at: 4)
list.insert(11, at: 4)
list.insert(13, at: 4)
list.insert(15, at: 4)
//print(list)
//list.delete(15)
//print(list)

for i in 1...5 {
    print(list)
    list.delete(i)
    
}
print(list)
print(list.search(10))


