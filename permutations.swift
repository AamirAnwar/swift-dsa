import Foundation

func permute(_ x:[String], _ k:Int, _ s:String, _ count:inout Int)  {
    guard k < x.count else {
        print(s)
        count += 1
        return
    }
    var a = x
    for i in k..<x.count {
        a.swapAt(i,k)
        let permutation = s + a[k]
        permute(a, k+1, permutation, &count)
    }
}
var totalCount = 0
permute(["A", "B", "C", "D"], 0, "", &totalCount)
print(totalCount)



