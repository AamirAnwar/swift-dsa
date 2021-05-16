import UIKit

// Vertex

public struct Vertex<T>: Equatable where T:Hashable {
    public var data:T
    public let index:Int
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(index): \(data)"
    }
}

extension Vertex:Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(data)
        hasher.combine(index)
    }
}

public func ==<T>(lhs:Vertex<T>, rhs:Vertex<T>) -> Bool {
    guard lhs.index == rhs.index else {
        return false
    }
    guard lhs.data == rhs.data else {
        return false
    }
    return true
}

// Edge

public struct Edge<T>:Equatable where T:Hashable {
    public let from:Vertex<T>
    public let to:Vertex<T>
    public let weight:Double?
}

extension Edge:CustomStringConvertible {
    public var description: String {
        guard let weight = weight else {
            return "\(from.description) -> \(to.description)"
        }
        return "\(from.description) - (\(weight) -> \(to.description)"
        
    }
}

extension Edge:Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(from)
        hasher.combine(to)
        if let weight = weight {
            hasher.combine(weight)
        }
    }
}

public func ==<T>(lhs:Edge<T>, rhs:Edge<T>) -> Bool {
    guard lhs.from == rhs.from else {
        return false
    }
    
    guard lhs.to == rhs.to else {
        return false
    }
    
    guard lhs.weight == rhs.weight else {
        return false
    }
    
    return true
    
}


// Abstract Graph

open class AbstractGraph<T>: CustomStringConvertible where T:Hashable {
    
    public var description: String {
        fatalError("abstract property accessed")
    }
    
    open var vertices:[Vertex<T>] {
        fatalError("abstract property accessed")
    }
    
    open var edges:[Edge<T>] {
        fatalError("abstract property accessed")
    }
    
    public required init() {
        
    }
    
    open func createVertex(_ data:T) -> Vertex<T> {
        fatalError("abstract function called")
    }
    
    
    open func addDirectedEdge(_ from:Vertex<T>, toVertex to:Vertex<T>, withWeight weight:Double?=nil) {
        fatalError("abstract function called")
    }
    
    open func addUndirectedEdge(_ vertices:(Vertex<T>, Vertex<T>), withWeight weight:Double?=nil) {
        fatalError("abstract function called")
    }
    
    
    open func weightFrom(_ sourceVertex:Vertex<T>, to destinationVertex:Vertex<T>) -> Double? {
        fatalError("abstract function called")
    }
    
    open func edgesFrom(_ sourceVertex:Vertex<T>) -> [Edge<T>] {
        fatalError("abstract function called")
    }
}

// Adjacency list
class EdgeList<T> where T:Hashable {
    var vertex: Vertex<T>
    var edges: [Edge<T>]?
    
    init(vertex:Vertex<T>) {
        self.vertex = vertex
    }
    
    func addEdge(_ edge:Edge<T>) {
        edges?.append(edge)
        
    }
}

open class AdjacencyListGraph<T>:AbstractGraph<T> where T:Hashable {
    var adjacencyList:[EdgeList<T>] = []
    
    public required init() {
        super.init()
    }
    
    open override var vertices:[Vertex<T>] {
        var vertices = [Vertex<T>]()
        for list in adjacencyList {
            vertices.append(list.vertex)
        }
        return vertices
    }
    
    open override var edges:[Edge<T>] {
        var allEdges = [Edge<T>]()
        for list in adjacencyList {
            guard let edges = list.edges else {
                continue
            }
            for edge in edges {
                allEdges.append(edge)
            }
        }
        return allEdges
    }
    
    open override func createVertex(_ data: T) -> Vertex<T> {
        let matchingVertices = vertices.filter { vertex in
            vertex.data == data
        }
        
        if matchingVertices.count > 0 {
            return matchingVertices.last!
        }
        
        let v = Vertex<T>.init(data:data, index:adjacencyList.count)
        adjacencyList.append(EdgeList.init(vertex:v))
        return v
    }
    
    open override func addDirectedEdge(_ from: Vertex<T>, toVertex to: Vertex<T>, withWeight weight: Double? = nil) {
        let edge = Edge<T>.init(from:from, to:to, weight:weight)
        let edgeList = adjacencyList[from.index]
        if edgeList.edges != nil {
            edgeList.addEdge(edge)
        } else {
            edgeList.edges = [edge]
        }
    }
    
    open override func addUndirectedEdge(_ vertices: (Vertex<T>, Vertex<T>), withWeight weight: Double? = nil) {
        addDirectedEdge(vertices.0, toVertex: vertices.1, withWeight: weight)
        addDirectedEdge(vertices.1, toVertex: vertices.0, withWeight: weight)
    }
    
    open override func weightFrom(_ sourceVertex: Vertex<T>, to destinationVertex: Vertex<T>) -> Double? {
        guard let edges = adjacencyList[sourceVertex.index].edges else {return nil}
        
        for edge in edges {
            if edge.to == destinationVertex {
                return edge.weight
            }
        }
        
        return nil
    }
    
    open override func edgesFrom(_ sourceVertex: Vertex<T>) -> [Edge<T>] {
        return adjacencyList[sourceVertex.index].edges ?? []
    }
    
    public override var description: String {
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
    
    
}


//Driver
for graph in [AdjacencyListGraph<Int>()] {
    
    let v1 = graph.createVertex(1)
    let v2 = graph.createVertex(2)
    let v3 = graph.createVertex(3)
    let v4 = graph.createVertex(4)
    let v5 = graph.createVertex(5)
    
    graph.addDirectedEdge(v1, toVertex: v2, withWeight: 1.0)
    graph.addDirectedEdge(v2, toVertex: v3, withWeight: 1.0)
    graph.addDirectedEdge(v3, toVertex: v4, withWeight: 4.5)
    graph.addDirectedEdge(v4, toVertex: v1, withWeight: 2.8)
    graph.addDirectedEdge(v2, toVertex: v5, withWeight: 3.2)
    print(graph)
}



