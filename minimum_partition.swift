var cache:[String:Int] = [:]
var TOTALCALLS:Int = 0
func minSumPartition(_ a:[Int], _ pos:Int,_  A:[Int], _ B:[Int],_ min:inout Int) {
    TOTALCALLS += 1
//    print(a,pos,A,B,min)
    let sum1 = A.reduce(0) { prev, value in
        return prev + value
    }
    
    let sum2 = B.reduce(0) { prev, value in
        return prev + value
    }
    
    cache[getCacheKey(A, B)] = abs(sum1 - sum2)
    cache[getCacheKey(B, A)] = abs(sum1 - sum2)
    
    guard A.count + B.count < a.count else {
        if abs(sum1 - sum2) <= min {
            print("Answer \(A) \(B) \(min)")
            min = abs(sum1 - sum2)
        }
        return
    }
    var nextA = A
    var nextB = B
    
    nextA.append(a[pos])
    nextB.append(a[pos])
    
    let cacheKey1 = getCacheKey(A, nextB)
    let cacheKey2 = getCacheKey(nextA, B)
//    minSumPartition(a, pos+1, nextA, B, &min)
//    minSumPartition(a, pos+1, A, nextB, &min)
//
    if cache[cacheKey1] != nil {
        print("[info] cache hit! \(cacheKey1)" )
        return
    } else {
        minSumPartition(a, pos+1, A, nextB, &min)
    }
    
    
    if cache[cacheKey2] != nil {
        print("[info] cache hit! \(cacheKey2)" )
        return
    } else {
        minSumPartition(a, pos+1, nextA, B, &min)
    }
    
    
}

func getCacheKey(_ A:[Int], _ B:[Int]) -> String {
    var cacheKey = ""
    for x in A {
        cacheKey += "\(x)_"
    }
    cacheKey += "|"
    for x in B {
        cacheKey += "\(x)_"
    }
    
    return cacheKey
}

let S = [10,20,15,5,25]
var min = Int.max
minSumPartition(S,0,[],[],&min)
print(min)
print(TOTALCALLS)
print(cache)

