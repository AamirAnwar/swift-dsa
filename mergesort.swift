
func merge(_ x:inout [Int], _ l:Int, _ m:Int, _ r:Int) {
    let p = Array(x[l...m])
    let q = Array(x[m+1...r])
    var k = l
    var a = 0
    var b = 0
    while (k < x.count) && (a < p.count) && (b < q.count) {
        if p[a] < q[b] {
            x[k] = p[a]
            a += 1
        } else {
            x[k] = q[b]
            b += 1
        }
        k += 1
        
    }
    
    while a < p.count {
        x[k] = p[a]
        a += 1
        k += 1
    }
     
    while b < q.count {
        x[k] = q[b]
        b += 1
        k += 1
    }
}


func _mergesort(_ l:Int, _ r:Int, _ x: inout [Int]) -> Void {
    guard l < r else {
        return
    }
    
    let m:Int = l + (r-l)/2
    print("Middle value is \(m)")
    print(x[l...m])
    print(x[m+1...r])
    
    _mergesort(l, m, &x)
    _mergesort(m+1, r, &x)
    merge(&x, l, m ,r)
    
}

func mergeSort(_ x: inout [Int]) -> Void {
    _mergesort(0, x.count-1, &x)
}

var input = [9,8,7,6,5,4,3,2,1]
mergeSort(&input)
print(input)







