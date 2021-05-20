import Foundation

func shuffle(_ x : inout [Int]) {
    guard x.isEmpty == false else {
        return
    }
    
    let n = x.count
    for i in (0..<n).reversed() {
        let randomIndex = Int.random(in:0...i)
        x.swapAt(i,randomIndex)
    }
          
}

var input = [1,2,3,4,5]
shuffle(&input)
print(input)

