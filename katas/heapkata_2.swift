import Foundation

class Heap {
    var list:[Int] = []
    
    func insert(_ x:Int) {
        guard list.isEmpty == false else {
            list.append(x)
            return
        }
        list.append(x)
        var i = list.count - 1
        while list[i] > list[(i-1)/2] {
            list.swapAt(i,(i-1)/2)
            i = (i-1)/2
        }
        
    }
    
    func buildHeap(input:[Int]) {
        
    }
    
    
    func heapify(index:Int) {
        guard index < list.count else {return}
        var largest = index
        let left = 2*index + 1
        let right = 2*index + 2
        let n = list.count
        
        if left < n, list[left] > list[largest] {
            largest = left
        }
        
        if right < n, list[right] > list[largest] {
            largest = right
        }
        
        if largest != index {
            list.swapAt(largest,index)
            heapify(index:largest)
        }
        
    }
    
    func extractMax() -> Int? {
        guard list.isEmpty == false else {return nil}
        list.swapAt(0,list.count-1)
        let x = list.remove(at:list.count-1)
        heapify(index:0)
        return x
    }
    
    func getMax() -> Int? {
        return list.first
    }
    
}


let heap = Heap()
let input = [1,2,3,54,6,7]
for i in input {
    heap.insert(i)
    print(heap.list)
}

while heap.list.isEmpty == false {
    if let max = heap.extractMax() {
        print(max)
    }
}
print(heap.list)

