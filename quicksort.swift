func partition(_ l:Int, _ r:Int, _ x: inout [Int]) -> Int {

    let pivot = x[r]
    var i = l-1
    
    for j in l..<r {
        if x[j] < pivot {
            i += 1
            x.swapAt(i,j)
        }
    }
    
    i += 1
    x.swapAt(i, r)
    return i
}

func _quicksort(_ l:Int, _ r:Int, _ x: inout [Int]) {
   guard l < r else {return}
   let m = partition(l,r,&x)
   _quicksort(l,m-1,&x)
   _quicksort(m+1,r,&x)
}

func qsort(_ x: inout [Int]) {
   _quicksort(0,x.count-1,&x)
}

var x = [9,8,7,6,5,4,3,2,1]
qsort(&x)
print(x)





