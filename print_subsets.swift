import Foundation

func subsetUtil(_ size:Int, _ pos:Int ,_ a:[Int],  _ output: [Int]) {
    guard pos < a.count-size else {return}
    guard size > 0 else {
        print(output)
        return
    }
    
    for j in pos+1..<a.count - size + 1  {
        var output = output
        output.append(a[j])
        subsetUtil(size-1, j, a, output)
    }
}

func subsets(_ a:[Int]) {
    for size in 1...a.count {
        for pos in 0..<a.count {
            subsetUtil(size-1, pos, a, [a[pos]])
        }
        
    }
    
}

let arr = [1,2,3,4]
subsets(arr)

