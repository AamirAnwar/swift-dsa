import UIKit

// Enqueue
// Dequeue
// Front
// Back
// isEmpty
// isFull


class Queue<T> {
    var capacity:Int
    var list:[T]
    
    init(withCapacity size:Int) {
        self.capacity = size
        self.list = []
    }
    
    public func front() -> T? {
        return self.list.first
    }
    
    public func back() -> T? {
        return self.list.last
    }
    
    public func enqueue(_ x:T) {
        guard isFull() == false else {
            print("[error] Queue is full")
            return
        }
        self.list.append(x)
    }
    
    public func dequeue() -> T? {
        guard isEmpty() == false else {return nil}
        let x = self.list.first
        self.list.remove(at: 0)
        return x
    }
    
    public func isEmpty() -> Bool {
        return self.list.isEmpty
    }
    
    public func isFull() -> Bool {
        return self.list.count == capacity
    }
    
    public func log() {
        guard isEmpty() == false else {return}
        for x in self.list {
            print(x, separator: "", terminator: " | ")
        }
        print("")
    }
}


let storage = Queue<Int>(withCapacity: 4)

for i in 0...10 {
    storage.enqueue(i)
    storage.log()
}

while storage.isEmpty() == false {
//for _ in 0...10 {
    storage.dequeue()
    storage.log()
    print("is storage empty \(storage.isEmpty())")
}




