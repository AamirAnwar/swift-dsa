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
        print("Hello")
        print(adjacencyList)
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
}


let graph = Graph()
let A = graph.createVertex(data: 10)
let B = graph.createVertex(data: 3)
let C = graph.createVertex(data: 4)
let D = graph.createVertex(data: 8)

graph.addDirectedEdge(from: A, to: B)
graph.addDirectedEdge(from: A, to: C)
graph.addDirectedEdge(from: B, to: C)
graph.addDirectedEdge(from: C, to: D)
graph.addDirectedEdge(from: D, to: A)


print(graph)
graph.dfs(startAt: A)



