import Foundation



func coinChange(coins:[Int], sum:Int) -> Int {
    var matrix = [[Int]]()
    for _ in 0...coins.count {
        var row = [Int](repeating:0, count:sum+1)
        row[0] = 1
        matrix.append(row)
    }
    
    for i in 1...coins.count {
        for j in 1...sum {
            let coin = coins[i-1]
            print("[info] coin \(coin)")
            var n = 0
            if coin <= j {
                n += matrix[i][j-coin]
            }
            n += matrix[i-1][j]
            print("\(coin) \(j) \(n)")
            matrix[i][j] = n
        }
    }
    
    for r in matrix {
        print(r)
    }
    
    return matrix[coins.count][sum]
}


//https://leetcode.com/problems/coin-change
func minCoins(coins:[Int], sum:Int) -> Int {
    guard sum > 0 else {return 0}
    var matrix = [[Int]]()
    for _ in 0...coins.count {
        var row = [Int](repeating:0, count:sum+1)
        row[0] = 0
        matrix.append(row)
    }
    for i in 1...sum {
        matrix[0][i] = -1
    }
    for i in 1...coins.count {
        for j in 1...sum {
            let coin = coins[i-1]
            
            let v1 = matrix[i-1][j]
            var v2:Int?
            if j >= coin && matrix[i][j-coin] >= 0 {
                v2 = 1 + matrix[i][j-coin]
            }
            
            if let v2 = v2 {
                if v1 != -1 {
                    matrix[i][j] = min(v1,v2)
                } else {
                    matrix[i][j] = v2
                }
            } else {
                matrix[i][j] = v1
            }
        }
    }
    
    for row in matrix {
        print(row)
    }
    
    return matrix[coins.count][sum]
}


let coins = [2,5,10,1]
let sum = 27
print(minCoins(coins: coins, sum: sum))


//[186,419,83,408]
//6249

//[2,5,10,1]
//27

