import Foundation



func countSteps(_ steps:[Int], _ W:Int) -> Int {
    guard steps.isEmpty == false else {return 0}
    
    var dp:[[Int]] = [[Int]](repeating:[Int](repeating:0, count: W+1), count:steps.count+1)
    
    for i in 0..<dp.count {
        dp[i][0] = 1
    }
    
    for row in dp {
        print(row)
    }
    print()
    
    for i in 1...steps.count {
        for j in 1...W {
            let currentStep = steps[i-1]
            if currentStep > j {
                dp[i][j] = dp[i-1][j]
            } else {
                for k in 0...i-1 {
                    let w = steps[k]
                    if j >= w {
                        dp[i][j] += dp[i][j-w]
                    }
                }
            }
        }
    }
    for row in dp {
        print(row)
    }
    return dp[steps.count][W]
}


let steps = [1,2,3]
let distance = 4


print(countSteps(steps, distance))
