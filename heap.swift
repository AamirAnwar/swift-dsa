import Foundation

class MinHeap {
    private(set) var list = [Int]()
    
    func getParentIndexOf(_ index:Int) -> Int? {
        guard index > 0 else {
            return -1
        }
        let pIndex = (index - 1)/2
        if pIndex >= 0 {
            return pIndex
        }
        return nil
    }
    
    func getChildIndexOf(_ parentIndex:Int) -> (Int?, Int?)? {
        let l = 2*parentIndex + 1
        let r = 2*parentIndex + 2
        var result:(Int?,Int?)? = (nil,nil)
        if l < list.count {
            result?.0 = l
        }
        if r < list.count {
            result?.1 = r
        }
        return result
    }
    
    private func heapify(_ pos:Int) {
        guard pos >= 0 && pos < list.count else {
            return
        }
        
        if let pIndex = getParentIndexOf(pos), pIndex >= 0 {
            let parent = list[pIndex]
            if parent > list[pos] {
                list.swapAt(pIndex, pos)
                heapify(pIndex)
            }
        }
        
        if let (l,r) = getChildIndexOf(pos) {
            guard let l = l, let r = r else {
                if l == nil && r == nil {
                    return
                }
                
                if let r = r {
                    if list[r] < list[pos] {
                        list.swapAt(r, pos)
                        heapify(r)
                    }
                } else if let l = l {
                    if list[l] < list[pos] {
                        list.swapAt(l, pos)
                        heapify(l)
                    }
                }
                return
            }
            let leftChild = list[l]
            let rightChild = list[r]
            
            if leftChild < rightChild {
                if leftChild < list[pos] {
                    list.swapAt(l, pos)
                    heapify(l)
                }
            } else {
                if rightChild < list[pos] {
                    list.swapAt(r, pos)
                    heapify(r)
                }
                
            }
        }
    }
    public func getMin() -> Int? {
        return list.first
    }
    
    public func extractMin() -> Int? {
        guard list.isEmpty == false else {
            return nil
        }
        
        list.swapAt(0, list.count - 1)
        let minElement = list.popLast()
        heapify(0)
        return minElement
    }
    
    public func insert(_ x:Int) {
        if list.isEmpty {
            list.append(x)
            return
        }
        
        list.append(x)
        let i = list.count - 1
        heapify(i)
    }
    
    public func log() {
        print(list)
    }
    
}
let heap = MinHeap()
let input = [9,8,7,6,5,4,3,2,1]
for i in input {
    heap.insert(i)
}
heap.log()
while heap.list.isEmpty == false {
    if let min = heap.extractMin() {
        print(min)
    }
}
heap.log()



