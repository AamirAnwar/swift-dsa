import Foundation

// time: O(n*W), space: O(n*W)
func knapsack(_ weights:[Int], _ values:[Int], _ W:Int) -> Int {
    guard weights.count == values.count else {return 0}
    guard weights.count > 0 else {return 0}
    guard W > 0 else {return 0}
    let n = weights.count
    var matrix = [[Int]](repeating:[Int](repeating:0, count:W+1), count:n+1)
    for i in 1...n {
        for j in 1...W {
            if i == 0 || j == 0 {
                matrix[i][j] = 0
                continue
            }
            let itemWeight = weights[i-1]
            let itemValue = values[i-1]
            var v = matrix[i-1][j]
            if j >= itemWeight {
                v = max(v, matrix[i-1][j - itemWeight] + itemValue)
            }
            matrix[i][j] = v
        }
    }
//    for row in matrix {
//        print(row)
//    }
    return matrix[weights.count][W]
}

let W = 10
let values = [1,2,3]
let weights = [2,4,6]

print(knapsack(weights, values, W))



