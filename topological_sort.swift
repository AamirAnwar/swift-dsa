// Graph Implementation
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
    var edges:[Edge]?
    
    init(vertex v:Vertex) {
        self.vertex = v
    }
    
    func addEdge(_ edge:Edge) {
        if edges != nil {
            edges?.append(edge)
        } else {
            edges = [edge]
         }
        
    }
}

class Graph {
    var list:[EdgeList] = []
    var vertices:[Vertex] {
        var result = [Vertex]()
        for l in list {
            result.append(l.vertex)
        }
        return result
    }
    func insertVertex(_ data:Int) -> Vertex {
        // Do stuff
        let matches = list.filter {edgeList in
            return edgeList.vertex.data == data
            
        }
        
        guard matches.isEmpty else {
            return matches.last!.vertex
        }
        
        let vertex = Vertex(data:data, index:vertices.count)
        list.append(EdgeList(vertex:vertex))
        return vertex
        
    }
    
    func addDirectedEdge(from:Vertex, to:Vertex, weight:Double?) {
        let edgeList = list[from.index]
        let edge = Edge(from:from, to:to, weight:weight)
        edgeList.addEdge(edge)
    }
    
    func addUndirectedEdge(from:Vertex, to:Vertex, weight:Double?) {
        addDirectedEdge(from: from, to: to, weight: weight)
        addDirectedEdge(from: to, to: from, weight: weight)
    }
    
    func dfs(start:Vertex) {
        var discovered = Set<Int>()
        var processed = Set<Int>()
        dfsUtil(start, discovered: &discovered, processed: &processed)
    }
    
    private func dfsUtil(_ vertex:Vertex?, discovered:inout Set<Int>, processed:inout Set<Int>) {
        guard let v = vertex else {return}
        
        if let edges = list[v.index].edges {
            for e in edges {
                if (discovered.contains(e.to.index) || processed.contains(e.to.index)) == false {
                    discovered.insert(e.to.index)
                    dfsUtil(e.to, discovered:&discovered, processed:&processed)
                }
            }
        }
        
        processed.insert(v.index)
        print("Processed vertex \(v.data)")
    }
    
}

let graph = Graph()

let A = graph.insertVertex(1)
let B = graph.insertVertex(2)
let C = graph.insertVertex(3)
let D = graph.insertVertex(4)
let E = graph.insertVertex(5)

graph.addDirectedEdge(from: A, to: B, weight: nil)
graph.addDirectedEdge(from: A, to: C, weight: nil)
graph.addDirectedEdge(from: B, to: D, weight: nil)
graph.addDirectedEdge(from: C, to: E, weight: nil)

graph.dfs(start:A)




