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

class Stack {
    private var list:[Vertex] = []
    var isEmpty:Bool {
        return list.isEmpty
    }
    func push(_ x:Vertex) {
        list.append(x)
    }
    
    func pop() -> Vertex? {
        return list.popLast()
    }
    
    func peek() -> Vertex? {
        return list.first
    }
    
}

class Graph: CustomStringConvertible {
    var adjacencyList: [EdgeList] = []
    private var queue = Queue()
    
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
    
    
    func bfs(startAt s:Vertex) {
        var processedVertices:Set<Int> = []
        var discoveredVertices:Set<Int> = []
        self.queue.enqueue(s)
        while let currentVertex = self.queue.dequeue()  {
            if (discoveredVertices.contains(currentVertex.index) || processedVertices.contains(currentVertex.index)) {
                continue
            }
            if let edges = adjacencyList[currentVertex.index].edges {
                for edge in edges {
                    self.queue.enqueue(edge.to)
                    discoveredVertices.insert(currentVertex.index)
                }
                processedVertices.insert(currentVertex.index)
                print("Processed vertex with data \(currentVertex.data)")
            }
            
        }
    }
    
    func _dfs(_ vertex:Vertex, processed:inout Set<Int>, discovered:inout Set<Int>) {
        
        
        if let edges = adjacencyList[vertex.index].edges {
            for e in edges {
                if (discovered.contains(e.to.index) || processed.contains(e.to.index)) == true {
                    continue
                }
                print("[info] discovered \(e.to.data)")
                discovered.insert(e.to.index)
                _dfs(e.to ,processed: &processed, discovered: &discovered)
            }
        }
        
        processed.insert(vertex.index)
        print("[info] finished processing \(vertex.data)")
    }
    
    
    func dfs(startAt start:Vertex) {
        var processed:Set<Int> = []
        var discovered:Set<Int> = [start.index]
        _dfs(start, processed: &processed, discovered: &discovered)
    }
    
    func performFloydWarshall(from:Vertex, to:Vertex) -> Double? {
        print("Running floyd warshall algo in O(v^3)")
        let n = vertices.count
        var distanceMatrix:[[Double]] = [[Double]]()
        for i in 0..<n {
            var l = [Double](repeating: Double(Int.max), count: n)
            l[i] = 0.0
            distanceMatrix.append(l)
            
        }
        
        for v in vertices {
            if let edges = adjacencyList[v.index].edges {
                for e in edges {
                    if let w = e.weight {
                        distanceMatrix[e.from.index][e.to.index] = w
                    } else {
                        assert(true, "Weight missing")
                    }
                }
            }
        }
        
        for x in distanceMatrix {
            print(x)
        }
        print("\n")
        
        for k in 0..<n {
            for i in 0..<n {
                for j in 0..<n {
                    let currentDistance = distanceMatrix[i][j]
                    let candidateDistance = distanceMatrix[i][k] + distanceMatrix[k][j]
                    if currentDistance > candidateDistance {
                        distanceMatrix[i][j] = candidateDistance
                    }
                }
            }
        }
        
        for x in distanceMatrix {
            print(x)
        }
        
        
        return distanceMatrix[from.index][to.index]
    }
    
    func performDijkstra(_ s:Vertex) {
        print("Running Dijkstra's Algorithm for finding single source shortest paths in O(mn)")
        var processed:Set<Int> = Set<Int>()
        var distanceMap:Dictionary<Int, Double> = [:]
        processed.insert(s.index)
        distanceMap[0] = 0.0
        while processed.count < vertices.count {
            let procVertices:[Int] = processed.map {v in
                return v
            }
            var min:Double?
            var minEdge:Edge?
            for sourceVertexIndex in procVertices {
                
                if let edges = adjacencyList[sourceVertexIndex].edges {
                    
                    for e in edges {
                        if processed.contains(e.to.index) == false {
                            var prevWeight:Double = 0
                            if let w = distanceMap[sourceVertexIndex] {
                                prevWeight += w
                            }
                            prevWeight += e.weight ?? 0.0
                            if let x = min {
                                if prevWeight < x {
                                    min = prevWeight
                                    minEdge = e
                                }
                                
                            } else {
                                min = prevWeight
                                minEdge = e
                            }
                        }
                    }
                    
                }
            }
            if let minEdge = minEdge, let min = min {
                processed.insert(minEdge.to.index)
                distanceMap[minEdge.to.index] = min
            }
        }
        print(distanceMap)
    }
}


let graph = Graph()
let A = graph.createVertex(data: 1)
let B = graph.createVertex(data: 2)
let C = graph.createVertex(data: 3)
let D = graph.createVertex(data: 4)

graph.addDirectedEdge(from: A, to: B, weight:1)
graph.addDirectedEdge(from: A, to: C, weight:4)
graph.addDirectedEdge(from: B, to: C, weight:2)
graph.addDirectedEdge(from: B, to: D, weight:7)
graph.addDirectedEdge(from: C, to: D, weight:1)


//graph.performDijkstra(A)
print(graph.performFloydWarshall(from: A, to: D)!)



