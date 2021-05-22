import Foundation

// WAP to reverse a string
func reverse(_ x:inout [String.Element]) -> String {
    var l = 0
    var r = x.count - 1
    
    
    while l < r {
        x.swapAt(l,r)
        l += 1
        r -= 1
    }
    return String(x)
}


var x = "aamir"
var input = Array(x)
print(reverse(&input))


