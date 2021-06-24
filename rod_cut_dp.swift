import Foundation



func cutRod(_ values:[Int], _ n:Int) -> Int {
    guard values.isEmpty == false else {return 0}
    
    var dp:[[Int]] = [[Int]](repeating:[Int](repeating:0, count: n+1), count:values.count+1)
    
    for row in dp {
        print(row)
    }
    print()
    for i in 1...values.count {
        for j in 1...n {
            dp[i][j] = dp[i-1][j]
            if j >= i {
                dp[i][j] = max(dp[i][j], dp[i][j-i] + values[i-1])
            }
        }
    }
    
    for row in dp {
        print(row)
    }
    
    print()
    
    
    
    
    
    return 0
}


let values = [3,5,8,9,10,17,17,20]
let rodLength = 8
print(cutRod(values, rodLength))



