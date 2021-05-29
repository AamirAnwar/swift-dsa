import Foundation
// Minheap
class Heap {
    private(set) var list = [Int]()
    
    func buildHeap(_ x:[Int]) {
        self.list = x
        
        let j:Int = x.count/2
        
        for i in (0..<j).reversed() {
            heapify(i)
        }
    }
    
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
    
    func getMin() -> Int? {
        return list.first
    }
    
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

