import Foundation
func lcs(_ s1:String, _ s2:String) -> Int {
    guard s1.isEmpty == false && s2.isEmpty == false else {return 0}
    
    var matrix = [[Int]]()
    for _ in 0...s1.count {
        let row = [Int](repeating:0, count:s2.count+1)
        matrix.append(row)
    }
    
    
    for i in 1...s1.count {
        for j in 1...s2.count {
            let index1 = s1.index(s1.startIndex, offsetBy: i-1)
            let index2 = s2.index(s2.startIndex, offsetBy: j-1)
            let substring1 = String(s1[index1])
            let substring2 = String(s2[index2])
        
            if substring1 == substring2 {
                print("matching \(substring1) \(substring2)")
                matrix[i][j] =   1 + matrix[i-1][j-1]
            } else {
                matrix[i][j] = max(max(matrix[i-1][j], matrix[i][j-1]), matrix[i-1][j-1])
            }
        }
    
    }
    
    for row in matrix {
        print(row)
    }
    
    return matrix[s1.count][s2.count]
    
}


let s1 = "abcde"
let s2 = "ace"

print(lcs(s1,s2))



