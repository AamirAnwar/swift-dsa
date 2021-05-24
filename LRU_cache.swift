
class Node {
    var data:Int
    var key:Int
    var next:Node?
    var prev:Node?
    
    init(data:Int, key:Int) {
        self.data = data
        self.key = key
    }
}

extension Node: CustomStringConvertible {
    var description:String 
    {
        var s = "(key:\(key) value:\(data)"
        if let prev = prev {
            s += " prev:\(prev.data)"
        }
        
        if let next = next {
            s += " next:\(next.data)"
        }
        s += ")"
        return s
    }
}

class LRUCache {
    var capacity:Int
    var lookup:[Int:Node] = [:]
    var head:Node?
    var tail:Node?
    var count:Int {return lookup.count}
    
    init(_ capacity: Int) {
        self.capacity = capacity 
    }
    
    func get(_ key: Int) -> Int {
        guard let node = lookup[key] else {
            return -1
        }
        
        
        if let head = head, let tail = tail, head.key == tail.key {
            return node.data
        }
        
        moveToLast(node)
        log()
        return node.data 
    }
    
    func put(_ key: Int, _ value: Int) {
        guard capacity > 0 else {return}
        
        if let node = lookup[key] {
            moveToLast(node)
            node.data = value 
            return
        }
        
        
        var newNode = Node(data:value,key:key)
        
        
        
        
        if head == nil {
            head = newNode 
            tail = newNode
            lookup[key] = newNode
            log()
            return 
        }    
        
        if count + 1 > capacity {
            // If exceeding capacity 
            assert(head != nil , "head is nil!")
            let t = head!
            
            lookup[t.key] = nil                

            head = t.next
            head?.prev = nil 

            t.next = nil
            t.prev = nil

            tail?.next = newNode
            newNode.prev = tail
            tail = newNode
            
        } else {
            // If within capacity limits 
            tail?.next = newNode
            newNode.prev = tail 
            tail = newNode
        }
        
        
        lookup[key] = newNode
        log()
    }
    
    
    func log() {
        return 
        var p = head 
        
        
        while let x = p {
            print(x)
            p = p?.next
        }
        
        print("")
    }
    
    
    func moveToLast(_ node:Node) {
        guard let h = head, let t = tail else {return}
        
        guard t.key != node.key  else {
            
            return 
        }
        
        var isHead = node.key == h.key 
        var isAdjacentToTail = node.next?.key == t.key
        var isOnlyNode = (node.key == h.key && node.key == t.key)
        
        if isOnlyNode {
            return 
        }
        
        if isHead {
            if isAdjacentToTail {
                t.prev = nil 
                t.next = node
                node.prev = t
                node.next = nil 
                head = t 
                tail = node     
            } else {
                head = head?.next
                head?.prev = nil 
                node.next = nil 
                node.prev = tail 
                tail?.next = node
                tail = node
            }
            

        } else {
            node.prev?.next = node.next 
            node.next?.prev = node.prev
            node.next = nil 
            node.prev = tail
            t.next = node
            tail = node            
        }
    

    }
    
    
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
