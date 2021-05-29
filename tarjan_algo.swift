import Foundation

// Graph

struct Vertex {
    var data:Int
    var index:Int
}

struct Edge {
    var from:Vertex
    var to:Vertex
    var weight:Double?
}

class EdgeList {
    var vertex:Vertex
    var edges: [Edge]?
    
    init(vertex:Vertex) {
        self.vertex = vertex
        
    }
    func addEdge(_ edge:Edge) {
        edges?.append(edge)
    }
    
    
}

class Graph: CustomStringConvertible {
    var adjacencyList: [EdgeList] = []

    
    var vertices:[Vertex] {
        var vertices = [Vertex]()
        for l in adjacencyList {
            vertices.append(l.vertex)
        }
        return vertices
    }
    var edges:[Edge] {
        var edges = [Edge]()
        for l in adjacencyList {
            if let edgeList = l.edges {
                for e in edgeList {
                    edges.append(e)
                }
            }
        }
        return edges
    }
    
    
    @discardableResult func createVertex(data:Int) -> Vertex {
        let match = vertices.filter { v in
            v.data == data
        }
        
        if let v = match.last {
            return v
        }
        
        
        let vertex = Vertex(data: data, index: adjacencyList.count)
        adjacencyList.append(EdgeList(vertex: vertex))
        return vertex
        
    }
    
    func addDirectedEdge(from:Vertex, to:Vertex, weight:Double?=nil) {
        if  adjacencyList[from.index].edges != nil {
            adjacencyList[from.index].edges?.append(Edge(from: from, to: to, weight: weight))
            
        } else {
            adjacencyList[from.index].edges = [Edge(from: from, to: to, weight: weight)]
        }
    }
    
    func addUndirectedEdge(from:Vertex, to:Vertex, weight:Double?=nil) {
        addDirectedEdge(from: from, to: to, weight: weight)
        addDirectedEdge(from: to, to: from, weight: weight)
    }
    
    func log() {
        print(adjacencyList)
    }
    
    
    public var description: String {
        var rows = [String]()
        for edgeList in adjacencyList {
            guard let edges = edgeList.edges else {
                continue
            }
            
            var row = [String]()
            for edge in edges {
                var value = "\(edge.to.data)"
                if edge.weight != nil {
                    value = "(\(value) : \(edge.weight!))"
                }
                row.append(value)
            }
            rows.append("\(edgeList.vertex.data) -> [\(row.joined(separator:", "))]")
        }
        return rows.joined(separator: "\n")
    }
    
    

    
    
    
    private func tarjanUtil(_ vertex:Vertex, disc:inout Set<Int>, proc:inout Set<Int>, time:inout Int,discoveryTime:inout [Int], low:inout [Int]) {
        
        if let edges = adjacencyList[vertex.index].edges {
            for e in edges {
                if disc.contains(e.to.index) == false && proc.contains(e.to.index) == false {
                    disc.insert(e.to.index)
//                    print("Discovered \(e.to.data)")
                    time += 1
                    discoveryTime[e.to.index] = time
                    low[e.to.index] = time
                    
                    tarjanUtil(e.to, disc:&disc, proc:&proc, time:&time, discoveryTime:&discoveryTime, low:&low)
                    
                    low[e.from.index] = min(low[e.to.index], low[e.from.index] )
                    
                } else {
                    
                    low[e.from.index] = min(low[e.from.index], discoveryTime[e.to.index] )
                }
                
                if e.from.index > 0 && discoveryTime[e.from.index] <= low[e.to.index] {
                    print("\(e.from.data) is a articulation vertex")
                }
                
            }
        }
//        print("Processed \(vertex.data)")
        
        
        
        proc.insert(vertex.index)
    }
    
    func performTarjan(_ s:Vertex) {
        var disc = Set<Int>()
        var proc = Set<Int>()
        var time:Int = 1
        var discoveryTime = [Int](repeating:Int.max, count:vertices.count)
        var low = [Int](repeating:Int.max, count:vertices.count)
        
        disc.insert(s.index)
        
        discoveryTime[0] = time
        low[0] = time
        
        tarjanUtil(s, disc:&disc, proc:&proc, time:&time, discoveryTime:&discoveryTime, low:&low)
        print(discoveryTime)
        print(low)
        
    }
}


let graph = Graph()
let A = graph.createVertex(data: 1) //
let B = graph.createVertex(data: 2)
let C = graph.createVertex(data: 3) //
let D = graph.createVertex(data: 4)
let E = graph.createVertex(data: 5)
let F = graph.createVertex(data: 6) //
let G = graph.createVertex(data: 7)
let H = graph.createVertex(data: 8)
let I = graph.createVertex(data: 9)
let J = graph.createVertex(data: 10)

graph.addDirectedEdge(from: A, to: B)
graph.addDirectedEdge(from: B, to: C)
graph.addDirectedEdge(from: C, to: E)
graph.addDirectedEdge(from: C, to: D)
graph.addDirectedEdge(from: D, to: A)
graph.addDirectedEdge(from: E, to: F)
graph.addDirectedEdge(from: F, to: H)
graph.addDirectedEdge(from: F, to: G)
graph.addDirectedEdge(from: G, to: E)
graph.addDirectedEdge(from: G, to: C)
graph.addDirectedEdge(from: H, to: I)
graph.addDirectedEdge(from: I, to: J)
graph.addDirectedEdge(from: I, to: F)
graph.addDirectedEdge(from: J, to: F)

graph.performTarjan(A)







