
import Foundation
// Merge sort


func merge(_ l:Int, _ m:Int ,_ r:Int, _ x:inout [Int]) {
    let A = Array(x[l...m])
    let B = Array(x[m+1...r])
    print("merging ",A,B)
    let n = A.count + B.count
    var k = l
    var i = 0
    var j = 0
    
    while k < (l+n) && i < A.count && j < B.count {
        if A[i] < B[j] {
            print("\(A[i]) < \(B[j])")
            x[k] = A[i]
            i += 1
        } else {
            x[k] = B[j]
            print("\(B[j]) < \(A[i])")
            j += 1
        }
        k += 1
    }
    
    for p in i..<A.count {
        x[k] = A[p]
        k += 1
    }
    
    for q in j..<B.count {
        x[k] = B[q]
        k += 1
    }
    print("Merged - ", x[l...r])
    
}



func _mergesort(_ l:Int, _ r:Int, _ x:inout [Int]) {
    guard l < r else {return}
    let m = l + (r-l)/2
    _mergesort(l,m,&x)
    _mergesort(m+1,r,&x)
    merge(l,m,r,&x)
    print(x)
}

func mergesort(_ x:inout [Int]) {
    _mergesort(0,x.count-1,&x)
    
}

var input = [1,2,3,4,7,6]

mergesort(&input)
print(input)


