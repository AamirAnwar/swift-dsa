import UIKit

// Selection sort
// Worst case complexity - O(n^2) [Hint - use a heap for better perf]

func selectionSort(_ x: inout [Int]) -> Void {
    guard x.count > 0 else {
        return
    }
    
    var k = -1
    for i in 0..<x.count {
        var min = i
        for j in i+1..<x.count {
            if x[min] > x[j] {
                min = j
            }
        }
        
        let temp = x[k+1]
        x[k+1] = x[min]
        x[min] = temp
        
        k = k+1
    }
}

var input = [9,8,7,6,5,4,3,2,1]
selectionSort(&input)
print(input)

