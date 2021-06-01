
https://leetcode.com/problems/number-of-islands/submissions/

class Solution {
    func printGrid(grid:[[Character]]) {
    for item in grid {
        print(item)
    }
    print("\n")
}

func isValidOffset(i:Int, j:Int,grid:inout [[Character]]) -> Bool {
    guard grid.isEmpty == false else {return false}
    let m = grid.count
    let n = grid[0].count
    return i>=0 && j>=0 && i<m && j<n
}

func attack(i:Int, j:Int, grid:inout [[Character]]) {
//    print("Attack - \(i) \(j)")
    guard isValidOffset(i: i, j: j, grid: &grid) else {
//        print("Offset not valid! - \(i) \(j)")
        return
    }
    guard grid[i][j] == "1" else {
//        print("Not 1!")
        return
    }
    grid[i][j] = "2"
    attack(i: i-1, j: j, grid: &grid)
    attack(i: i+1, j: j, grid: &grid)
    attack(i: i, j: j-1, grid: &grid)
    attack(i: i, j: j+1, grid: &grid)
    grid[i][j] = "0"
//    print("Change grid \(grid[i][j])")
}

func numIslands(_ grid: [[Character]]) -> Int {
    var battleField = grid
    var islands = 0
    for i in 0..<battleField.count {
        let row = battleField[i]
        for j in 0..<row.count {
            if battleField[i][j] == "1" {
                // Deploy!
                attack(i: i, j: j, grid: &battleField)
//                printGrid(grid:battleField)
                islands += 1
            }
        }
    }
    return islands
}
}
