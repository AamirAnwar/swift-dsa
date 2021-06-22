import Foundation

//https://leetcode.com/problems/longest-increasing-subsequence/submissions/
func lis(_ seq:[Int]) -> Int {
    guard seq.isEmpty == false else {return 0}
    var vector = [Int](repeating:1, count:seq.count)
    vector[0] = 1
    var max = 1
    
    
    for i in 1..<seq.count {
        var j = i-1
        while j >= 0 {
            if seq[j] < seq[i] {
                if vector[j] + 1 > vector[i] {
                    vector[i] = vector[j] + 1
                }
            }
            j = j - 1
        }
        if vector[i] > max {
            max = vector[i]
        }
    }
    return max
}


let seq = [1,3,6,7,9,4,10,5,6]
print(lis(seq))


//[10,9,2,5,3,7,101,18]
//4

//[10,78,16,15,8,7,5,20,30]
// 4

//[0,1,0,3,2,3]
//4

//[7,7,7,7,7,7,7]
//1

