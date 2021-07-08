import Foundation


struct Move {
    var i:Int
    var j:Int
    var marker:Marker
}

extension Move {
    func isValid(board:Board) -> Bool {
        return !board.isOutOfBounds(i: self.i, j: self.j) && board.isMoveAvailable(move:self)
    }
}

enum Marker {
    case O
    case X
}

class Player {
    var marker:Marker!
    
    init(marker:Marker) {
        self.marker = marker
    }

}

class Board {
    var grid:[[Marker?]]!
    var size:Int {
        return grid.count
    }
    
    func isOutOfBounds(i:Int, j:Int) -> Bool {
        return i<0 || i >= self.size || j < 0 || j >= self.size
    }
    
    init(size:Int) {
        self.grid = [[Marker?]](repeating:[Marker?](repeating:nil, count:size), count:size)
    }
    
    func isMoveAvailable(move:Move) -> Bool {
        guard isOutOfBounds(i: move.i, j: move.j) == false else {return false}
        return self.grid[move.i][move.j] == nil
    }
    
    
    
    
}


class Game {
    
    private(set) var board:Board!
    
    var trails:[(Int,Int)] = [(-1,-1), (-1,0), (-1, 1), (0,-1), (0,1), (1,-1), (1,0), (1,1)]
    init(boardSize:Int) {
        self.board = Board(size: boardSize)
    }
    
    
    private func getTrailCount(x:Int, y:Int, direction:(Int,Int), board:Board) -> Int {
        guard board.isOutOfBounds(i: x, j: y) == false else {
            return 0
        }
        let nextX = x + direction.0
        let nextY = y + direction.1
        
        if board.isOutOfBounds(i: nextX, j: nextY) == false {
            if let marker1 = board.grid[x][y], let marker2 = board.grid[nextX][nextY], marker1 == marker2 {
                return getTrailCount(x: nextX, y: nextY, direction: direction, board: board) + 1
            }
        }
        return 0
    }
    
    
    
    private func isWinningMove(move:Move) -> Bool {
        let x = move.i
        let y = move.j
        
        for t in trails {
            let trailCount = getTrailCount(x: x, y: y, direction: t, board: self.board)
            print(trailCount)
            if trailCount == board.size - 1 {
                return true
            }
        }
        return false
    }
    
    @discardableResult func makeMove(board:Board, move:Move) -> Bool {
        guard move.isValid(board: board) else {
            return false
        }
        self.board.grid[move.i][move.j] = move.marker
        if isWinningMove(move: move) {
            print("Game has been won!")
        }
        return true
    }
    
}

let g = Game(boardSize:3)
let p1 = Player(marker: .X)

g.makeMove(board: g.board, move: Move(i: 0, j: 0, marker: .X))
g.makeMove(board: g.board, move: Move(i: 0, j: 1, marker: .O))
g.makeMove(board: g.board, move: Move(i: 1, j: 0, marker: .X))
g.makeMove(board: g.board, move: Move(i: 2, j: 2, marker: .O))
g.makeMove(board: g.board, move: Move(i: 2, j: 0, marker: .X))

for row in g.board.grid {
    print(row)
}







