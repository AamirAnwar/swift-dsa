import UIKit

// Stack

// Push
// Pop
// isEmpty
// isFull
// Peek


class Stack<T> {
    private var capacity:Int
    private var list: [T]
    
    
    init(withCapacity capacity:Int ) {
        self.capacity = capacity
        self.list = [T]()
    }
    
    public func push(_ x:T) {
        guard isFull() == false else {
            print("[error] stack is full")
            return
        }
        self.list.append(x)
    }
    
    public func pop() -> T? {
        guard isEmpty() == false else {
            print("[error] stack is empty")
            return nil
        }
        return nil
    }
    
    public func peek() -> T? {
        return self.list.last
    }
    
    public func isFull() -> Bool {
        return self.list.count == capacity
    }
    
    public func isEmpty() -> Bool {
        return self.list.count == 0
    }
    
    public func log() {
        guard isEmpty() == false else {return}
        for x in self.list.reversed() {
            print(x, separator: "", terminator: " | ")
        }
        print("")
    }
}


let stack = Stack<Int>.init(withCapacity: 0)

print(stack.isEmpty())
print(stack.isFull())

for i in 0..<10 {
    stack.push(i)
    stack.log()
}
print(stack.peek() ?? -1)




