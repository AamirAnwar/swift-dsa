import Foundation


// O(2^n)
func subsetSumNaive(_ set:[Int], _ S:Int, _ i:Int) -> Bool {
    guard i >= 0 else {
        print("[info] hit a dead end", set, S, i)
        return false
        
    }
    print(set[0...i],S,i)
    
    if S == 0 {
        print("[info] found it!")
        return true
    }
    return subsetSumNaive(set, S, i-1) || subsetSumNaive(set, S-set[i], i-1)
}


func subsetSumDP(_ set:[Int], _ S:Int) -> Bool {
    
    
    guard set.isEmpty == false else {return false}
    var matrix = [[Bool]](repeating:[Bool](repeating:false, count:S+1), count:set.count+1)
    for i in 0..<matrix.count {
        matrix[i][0] = true
    }
    
    
    for i in 1...set.count {
        for j in 1...S {
            matrix[i][j] = matrix[i-1][j]
            if j >= set[i-1] {
                matrix[i][j] = matrix[i][j] || matrix[i-1][j-set[i-1]]
            }
        }
    }
    for row in matrix {
        print(row)
    }

    return matrix[set.count][S]
}


let set = [3, 34, 4, 12, 5, 2]
let sum = 9

//[3, 34, 4, 12, 5, 2]
//9

print(subsetSumDP(set, sum))

