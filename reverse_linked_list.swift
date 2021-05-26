import Foundation


class Node {
    var data:Int
    var next:Node?
    init(data:Int) {
        self.data = data
    }
}

class LinkedList {
    var head:Node?
    func insert(_ x:Int) {
        guard let head = head else {
            head = Node(data:x)
            return
            
        }
        
        let newNode = Node(data:x)
        newNode.next = head
        self.head = newNode
        
    }
    
    func reverse() {
        let x = self.head
        reverseUtil(head: head)
        x?.next = nil
    }
    
    func reverseUtil(head:Node?) {
        guard let p = head else {
            return
            
        }
        reverseUtil(head: p.next)
        if p.next == nil {
            self.head = p
        } else {
            p.next!.next = p
        }
    }
    
    func log() {
        var p = head
        while let q = p {
            print("\(q.data)", terminator: " -> ")
            p = q.next
        }
    }
    
}

let list = LinkedList()
for i in [10,12,32,53,64] {
    list.insert(i)
}
list.log()
print("")
list.reverse()
list.log()
print("")


