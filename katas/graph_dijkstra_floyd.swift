import Foundation

enum VertexEncoding:Int {
    case A = 1
    case B
    case C
    case D
}


struct Vertex {
    var data:Int
    var index:Int
    var encoding:VertexEncoding {
        return VertexEncoding(rawValue:data)!
    }
}

struct Edge {
    var from:Vertex
    var to:Vertex
    var weight:Double?
}


class EdgeList {
    var vertex:Vertex
    var edges:[Edge]?
    
    init(vertex:Vertex) {
        self.vertex = vertex
    }
    
    func addEdge(_ e:Edge) {
        if edges == nil {
            edges = [e]
        } else {
            edges?.append(e)
        }
    }
}



class Graph {
    var list:[EdgeList] = []
    var vertices:[Vertex] {
        return  list.map {(el) -> Vertex in
            el.vertex
        }
    }
    
    var edges:[Edge] {
        var result = [Edge]()
        for l in list {
            if let edges = l.edges {
                for e in edges {
                    result.append(e)
                }
            }
            
        }
        return result
        
    }
    
    
    func createVertex(_ data:Int) -> Vertex {
        let matches = vertices.filter() {v in
            v.data == data
        }
        guard matches.isEmpty else {return matches.last!}
        let vertex = Vertex(data:data, index:vertices.count)
        let el = EdgeList(vertex:vertex)
        list.append(el)
        return vertex
        
    }
    
    func addUndirectedEdge(from:Vertex, to:Vertex, weight:Double?) {
        list[from.index].addEdge(Edge(from:from, to:to, weight:weight))
        list[to.index].addEdge(Edge(from:to, to:from, weight:weight))
    }
    
    func addDirectedEdge(from:Vertex, to:Vertex, weight:Double?) {
        list[from.index].addEdge(Edge(from:from, to:to, weight:weight))
    }
    
    // O(V*E)
    func bellmanFord(_ start:Vertex) {
        let V = vertices.count
        let INF = Double.greatestFiniteMagnitude
        var dist = [Double](repeating:INF, count:V)
        dist[start.index] = 0.0
        
        for _ in 1..<V-1 {
            for e in edges {
                let weight = e.weight ?? 1.0
                if dist[e.to.index] > dist[e.from.index] + weight {
                    dist[e.to.index] = dist[e.from.index] + weight
                }
            }
        }
        for e in edges {
            let weight = e.weight ?? 1.0
            if dist[e.to.index] > dist[e.from.index] + weight {
                print("[info] negative weight cycle detected")
                return
            }
        }
        print(dist)
    }
    
    // (V*V*V)
    func floydwarshall() {
        var matrix = [[Double]]()
        let n = vertices.count
        for i in 0..<n {
            var row = [Double](repeating:Double.greatestFiniteMagnitude, count:n)
            row[i] = 0
            matrix.append(row)
        }
        for e in edges {
            matrix[e.from.index][e.to.index] = e.weight ?? 1.0
            
        }
        for k in 0..<n {
            for i in 0..<n {
                for j in 0..<n {
                    if matrix[i][j] > matrix[i][k] + matrix[k][j] && matrix[i][k] != Double.greatestFiniteMagnitude && matrix[k][j] != Double.greatestFiniteMagnitude {
                        matrix[i][j] = matrix[i][k] + matrix[k][j]
                    }
                }
            }
        }
        
        for r in matrix {
            print(r)
        }
    }
    
    // (V*V)
    func dijkstraShortestPathAlgorthm(_ start:Vertex) {
        var dist = [Int](repeating:Int.max, count:vertices.count)
        dist[start.index] = 0
        
        var disc = Set<Int>()
        disc.insert(start.index)
        
        while disc.count != vertices.count {
            var minVertex:Vertex!
            var minDistance:Int = Int.max
            for vertexIndex in disc {
                if let edges = list[vertexIndex].edges {
                    for e in edges {
                        let weight = Int(e.weight ?? 1.0)
                        let knownDist = dist[e.to.index]
                        let newDist = dist[e.from.index] + weight
                        if  newDist < knownDist && newDist < minDistance {
                            minDistance = newDist
                            minVertex = e.to
                        }
                    }
                }
            }
            dist[minVertex.index] = minDistance
            disc.insert(minVertex.index)
            
        }
        
        print(dist)
    }
}


let g = Graph()

let A = g.createVertex(1)
let B = g.createVertex(2)
let C = g.createVertex(3)
let D = g.createVertex(4)


g.addDirectedEdge(from: A, to: B, weight: 1)
g.addDirectedEdge(from: C, to: A, weight: 1)
g.addDirectedEdge(from: D, to: C, weight: 1)
g.addDirectedEdge(from: B, to: D, weight: 1)

g.dijkstraShortestPathAlgorthm(A)
g.floydwarshall()
g.bellmanFord(A)




