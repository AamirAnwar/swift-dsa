import Foundation

struct Vertex {
    var data:Int
    var index:Int
    
}

struct Edge {
    var from:Vertex
    var to:Vertex
    var weight:Double?
}

protocol GraphRepresentation {
    var vertices:[Vertex] {get}
    var edges:[Edge] {get}
    
    func createVertex(_ data:Int) -> Vertex
    func addDirectedEdge(from:Vertex, to:Vertex, weight:Double?)
    func addUndirectedEdge(from:Vertex, to:Vertex, weight:Double?)
}

class Graph:GraphRepresentation {
    
    var matrix:[[Double?]] = []
    private var _vertices:[Vertex] = []

    var vertices:[Vertex] {
        return _vertices
    }
    
    var edges:[Edge] {
        var result = [Edge]()
        for i in 0..<matrix.count {
            for j in 0..<matrix.count {
                if let weight = matrix[i][j] {
                    result.append(Edge(from:vertices[i], to:vertices[j], weight:weight))
                }
            }
        }
        return result
    }
    
    func createVertex(_ data: Int) -> Vertex {
        let matches = vertices.filter {v in
            v.data == data
        }
        guard matches.isEmpty else {return matches.last!}
        
        let vertex = Vertex(data:data, index:matrix.count)
        for i in 0..<matrix.count {
            matrix[i].append(nil)
        }
        matrix.append([Double?](repeating:nil, count:matrix.count+1))
        _vertices.append(vertex)
        return vertex
    }
    
    func addDirectedEdge(from: Vertex, to: Vertex, weight: Double?) {
        matrix[from.index][to.index] = weight
    }
    
    func addUndirectedEdge(from: Vertex, to: Vertex, weight: Double?) {
        matrix[from.index][to.index] = weight
        matrix[to.index][from.index] = weight
    }
    
    private func dfsUtil(_ vertex:Vertex, _ disc:inout Set<Int>, _ proc:inout Set<Int>) {
        let row = matrix[vertex.index]
        for (i,v) in row.enumerated() {
            guard let v = v, v == 1 && i != vertex.index else {
                continue
            }
            let toVertex = vertices[i]
            if disc.contains(toVertex.index) == false && proc.contains(toVertex.index) == false {
                disc.insert(toVertex.index)
                dfsUtil(toVertex,&disc,&proc)
            }
        }
        proc.insert(vertex.index)
        print("[info] processed vertex \(vertex.data)")
    }
    
    func dfs(start:Vertex) {
        var disc = Set<Int>()
        var proc = Set<Int>()
        disc.insert(start.index)
        dfsUtil(start, &disc, &proc)
    }
    
    func bfs(start:Vertex) {
        var disc = Set<Int>()
        var proc = Set<Int>()
        let queue = Queue()
        queue.enqueue(start)
        
        bfsUtil(queue:queue, disc:&disc, proc:&proc)
    }
    
    func bfsUtil(queue:Queue, disc:inout Set<Int> ,proc:inout Set<Int>) {
        while let vertex = queue.dequeue() {
            
            let row = matrix[vertex.index]
            for (i,v) in row.enumerated() {
                guard let v = v, v == 1 && i != vertex.index else {
                    continue
                }
                let toVertex = vertices[i]
                if disc.contains(toVertex.index) == false && proc.contains(toVertex.index) == false {
                    disc.insert(toVertex.index)
                    queue.enqueue(toVertex)
                }
            }
            
            proc.insert(vertex.index)
            print("[info] processed vertex \(vertex.data)")
        }
        
        
    }
    
    
}

class Queue  {
    var list:[Vertex] = []
    
    func enqueue(_ x:Vertex) {
        list.append(x)
    }
    
    func dequeue() -> Vertex? {
        guard list.isEmpty == false else {
            return nil
        }
        let x = list.remove(at:0)
        return x
    }
    
}



let graph = Graph()

let A = graph.createVertex(1)
let B = graph.createVertex(2)
let C = graph.createVertex(3)
let D = graph.createVertex(4)
let E = graph.createVertex(5)

graph.addUndirectedEdge(from: A, to: B, weight: 1.0)
graph.addUndirectedEdge(from: A, to: C, weight: 1.0)
graph.addUndirectedEdge(from: C, to: D, weight: 1.0)
graph.addUndirectedEdge(from: D, to: E, weight: 1.0)

graph.dfs(start:A)
print()
graph.bfs(start:A)



