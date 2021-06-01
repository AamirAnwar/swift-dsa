import Foundation

// Trie
class Node {
    var isEndofWord:Bool = false
    var children:[Node?] = [Node?](repeating:nil, count:26)
    var data:String
    init(data:String) {
        self.data = data
        
    }
}

class Trie {
    var root:Node = Node(data:"")
    
    
    // O(m) where m is the length of the string
    func search(_ x:String) -> Bool {
        var p = root
        
        for (i,l) in x.enumerated() {
            let q = String(l)
            guard let index = getIndexFor(s:q) else {
                return false
            }
            
            if let next = p.children[index] {
                p = next
                
                if i == x.count - 1 && next.isEndofWord {
                    return true
                }
            } else {
                return false
            }
        }
        
        return false
    }
    
    // O(m) where m is the length of the string
    func insert(_ x:String) {
        var p = root
        for (i,l) in x.enumerated() {
            guard let index = getIndexFor(s: String(l)) else {
                print("[error] invalid input")
                return
            }
            if let next = p.children[index] {
                p = next
            } else {
                let childNode = Node(data:String(l))
                p.children[index] = childNode
                p  = childNode
                if i == x.count - 1 {
                    childNode.isEndofWord = true
                }
            }
        }
    }
    
    
}

func getIndexFor(s:String) -> Int? {
    let c = Character(s.uppercased())
    if let v = c.asciiValue, let base = Character("A").asciiValue {
        return Int(v - base)
    }
    return nil
    
}


let dict = ["bat", "ball", "island", "tree"]
let tree = Trie()
for d in dict {
    tree.insert(d)
}

let check = ["aamir", "anwar", "island"]
for d in check {
    print(tree.search(d))
}




