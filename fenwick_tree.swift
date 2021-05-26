import Foundation

class FenwickTree {
    var bitlist = [Int]()
    var input = [Int]()
    
    init(input:[Int]) {
        self.input = input
        self.bitlist = [Int](repeating:0, count:self.input.count+1)
        for (i,v) in self.input.enumerated() {
            update(i,v)
        }
    }
    
    // O(log(n))
    func get(_ x:Int) -> Int {
        let n = self.bitlist.count
        guard x+1 < n else {
            print("\(x+1) is out of bounds \(n)")
            return -1
            
        }
        
        var index = x+1
        var sum = 0
        while index > 0 {
            sum += bitlist[index]
            index = index - (index & (-index))
        }
        
        return sum
    }
    
    // O(log(n))
    func update(_ x:Int, _ val:Int) {
        let n = self.bitlist.count
        
        guard x+1 < n else {return}
        
        var index = x+1
        while index <= n {
            
            bitlist[index] += val
            index = index + (index & (-index))
        }
        
    }
}

let fenwick = FenwickTree(input:[1,1,3,5,7,8])

for i in 0..<fenwick.input.count {
    print(i,fenwick.get(i))
    print(fenwick.input)
    print(fenwick.bitlist)
    print()
}



