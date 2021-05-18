import Foundation


func _binarySearch(_ l:Int, _ r:Int, _ input: [Int], _ x:Int) -> Int {
    guard l <= r else {return -1}
    let m = l + (r-l)/2
    let n = input[m]
    if n == x {
        return m
    } else if n > x {
        // Go left
        return _binarySearch(l, m-1, input, x)
    }
    // Go right
    return _binarySearch(m+1, r, input, x)
}


func bsearch(_ input:[Int], _ x:Int) -> Int {
    // Binary search
    return _binarySearch(0, input.count - 1, input, x)

}

let input = [1,2,3,4,5,6,7,8,9,10,11]
for x in 0..<30 {
    print(bsearch(input, x))
}


