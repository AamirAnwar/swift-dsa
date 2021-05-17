import UIKit

func insertionSort(_ x:inout [Int]) -> Void {
    guard x.count > 0 else {
        print("[warning] input to insertion sort should not be empty")
        return
    }
    var i = 0
    let n = x.count
    while i < n-1 {
       var j = i+1
       let temp = x[j]
       
       while j>0 && temp < x[j-1] {
          x[j] = x[j-1]
          j = j-1
       }
       x[j] = temp
       i = i+1
    }
}

var input = [6,1,3,2,5]
insertionSort(&input)
print(input)

