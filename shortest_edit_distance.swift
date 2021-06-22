import Foundation

// Shortest Edit Distance
//https://leetcode.com/problems/edit-distance/
func sed(_ s1:String, _ s2:String) -> Int {
    guard s1.isEmpty == false && s2.isEmpty == false else {
        if s1.isEmpty {
            return s2.count
        }
        
        return s1.count
    }
    var matrix = [[Int]]()
    for i in 0...s1.count {
        var row = [Int](repeating:0, count:s2.count+1)
        if i == 0 {
            for j in 0...s2.count {
                row[j] = j
            }
        }
        
        row[0] = i
        matrix.append(row)
    }
    
    
    for i in 1...s1.count {
        for j in 1...s2.count {
            let index1 = s1.index(s1.startIndex, offsetBy:i-1)
            let index2 = s2.index(s2.startIndex, offsetBy:j-1)
            let sub1 = s1[index1]
            let sub2 = s2[index2]
            print(sub1,sub2)
            if sub1 == sub2 {
                // match case
                matrix[i][j] =  matrix[i-1][j-1]
            } else {
                matrix[i][j] = 1 + min(min(matrix[i-1][j], matrix[i][j-1]), matrix[i-1][j-1])
            }
        }
    }
    
    
//    for r in matrix {
//        print(r)
//    }
    return matrix[s1.count][s2.count]
}


let s1 = ""
let s2 = "a"

print(sed(s1,s2))

