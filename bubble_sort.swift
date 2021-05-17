

public func bubbleSort(_ input: inout [Int]) {
    
    guard input.count > 0 else {
        return
    }
    
    let n:Int = input.count
    
    for _ in 0..<n {
        for i in 0..<n-1 {
            if input[i] > input[i+1] {
                let temp = input[i]
                input[i] = input[i+1]
                input[i+1] = temp
            }
        
        }
    }

}



var input = [6,1,3,2,5]

bubbleSort(&input)

print(input)


