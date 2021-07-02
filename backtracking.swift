import Foundation

var isFinished = false

func isASolution(a:[Bool], k:Int, n:Int) -> Bool {
    return k == n
}

func processSolution(a:[Bool], k:Int) {
    print("{", terminator:" ")
    for i in 1...k {
        
        if a[i] {
            print(i, terminator:" ")
        }
    }
    print("}", terminator:" \n")
}

func constructCandidates(a:[Bool], k:Int) -> [Bool] {
    return [true, false]
}

func makeMove(a:[Bool], k:Int) {
    
}

func unmakeMove(a:[Bool], k:Int) {
    
}

func backtrack(a:[Bool], k:Int, n:Int) {
    if isASolution(a: a, k: k, n: n) {
        processSolution(a: a, k: k)
    } else {
        let candidates = constructCandidates(a: a, k: k)
        for i in 0..<candidates.count {
            var arr = a
            arr[k+1] = candidates[i]
            makeMove(a: arr, k: k+1)
            backtrack(a: arr, k: k+1, n: n)
            unmakeMove(a: arr, k: k+1)
            if isFinished {
                return
            }
        }
    }
}


func generateSubsets() {
    let n = 3
    let a = [Bool](repeating: false, count: n+1)
    backtrack(a: a, k: 0, n: n)
}

generateSubsets()

