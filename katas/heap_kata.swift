import Foundation
// Minheap
class Heap {
    private(set) var list = [Int]()
    var isEmpty:Bool {
        return list.isEmpty
    }
    
    // O(n*log(n))
    func buildHeap(_ x:[Int]) {
        self.list = x
        
        let j:Int = x.count/2
        
        for i in (0..<j).reversed() {
            heapify(i)
        }
    }
    
    // O(log(n))
    func heapify(_ i:Int) {
       var smallest = i
       let left = 2*i + 1
       let right = 2*i + 2
       let n = list.count
       
       if left < n && list[left] < list[smallest] {
        smallest = left
       }
       
       if right < n && list[right] < list[smallest] {
        smallest = right
       }
       if smallest != i {
           list.swapAt(i,smallest)
           heapify(smallest)
       }
    }
    
    // O(1)
    func getMin() -> Int? {
        return list.first
    }
    
    // O(1)
    func extractMin() -> Int? {
        guard list.isEmpty == false else {return nil}
        list.swapAt(0,list.count-1)
        let x = list.popLast()
        heapify(0)
        return x
    }
    
}


let input = [9,8,6,5,3]
let heap = Heap()

heap.buildHeap(input)


print(heap.list)
while let min = heap.extractMin() {
    print(heap.list)
    print(min)
}
print(heap.list)






