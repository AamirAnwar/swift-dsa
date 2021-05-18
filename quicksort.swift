func partition(_ l:Int, _ r:Int, _ x: inout [Int]) -> Int {
    print(Array(x[l...r]))
    let pivot = x[r]
    var i = -1
    
    for j in 0..<x.count {
        if x[j] < pivot {
            i += 1
            // Swap i an j
            x.swapAt(i,j)
        }
    }
    
    i += 1
    x.swapAt(i, r)
    print(Array(x[l...r]))
    return i
}

func _quicksort(_ l:Int, _ r:Int, _ x: inout [Int]) {
    print(Array(x[l...r]))
   guard l < r else {return}
   let m = partition(l,r,&x)
   _quicksort(l,m-1,&x)
   _quicksort(m+1,r,&x)
}

func qsort(_ x: inout [Int]) {
   _quicksort(0,x.count-1,&x)
}


var x = [6,1,3,2,5]
qsort(&x)
print(x)


