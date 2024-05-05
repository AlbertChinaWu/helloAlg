/**
 * File: graph_adjacency_list.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Undirected graph class based on adjacency list */
public class GraphAdjList {
    // Adjacency list, key: vertex, value: all adjacent vertices of that vertex
    public private(set) var adjList: [Vertex: [Vertex]]

    /* Constructor */
    public init(edges: [[Vertex]]) {
        adjList = [:]
        // Add all vertices and edges
        for edge in edges {
            addVertex(vet: edge[0])
            addVertex(vet: edge[1])
            addEdge(vet1: edge[0], vet2: edge[1])
        }
    }

    /* Get the number of vertices */
    public func size() -> Int {
        adjList.count
    }

    /* Add edge */
    public func addEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("Parameter error")
        }
        // Add edge vet1 - vet2
        adjList[vet1]?.append(vet2)
        adjList[vet2]?.append(vet1)
    }

    /* Remove edge */
    public func removeEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("Parameter error")
        }
        // Remove edge vet1 - vet2
        adjList[vet1]?.removeAll { $0 == vet2 }
        adjList[vet2]?.removeAll { $0 == vet1 }
    }

    /* Add vertex */
    public func addVertex(vet: Vertex) {
        if adjList[vet] != nil {
            return
        }
        // Add a new linked list to the adjacency list
        adjList[vet] = []
    }

    /* Remove vertex */
    public func removeVertex(vet: Vertex) {
        if adjList[vet] == nil {
            fatalError("Parameter error")
        }
        // Remove the vertex vet's corresponding linked list from the adjacency list
        adjList.removeValue(forKey: vet)
        // Traverse other vertices' linked lists, removing all edges containing vet
        for key in adjList.keys {
            adjList[key]?.removeAll { $0 == vet }
        }
    }

    /* Print the adjacency list */
    public func print() {
        Swift.print("Adjacency list =")
        for (vertex, list) in adjList {
            let list = list.map { $0.val }
            Swift.print("\(vertex.val): \(list),")
        }
    }
}

#if !TARGET

@main
enum GraphAdjacencyList {
    /* Driver Code */
    static func main() {
        /* Initialize undirected graph */
        let v = Vertex.valsToVets(vals: [1, 3, 2, 5, 4])
        let edges = [[v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[2], v[3]], [v[2], v[4]], [v[3], v[4]]]
        let graph = GraphAdjList(edges: edges)
        print("\nAfter initialization, the graph is")
        graph.print()

        /* Add edge */
        // Vertices 1, 2 i.e., v[0], v[2]
        graph.addEdge(vet1: v[0], vet2: v[2])
        print("\nAfter adding edge 1-2, the graph is")
        graph.print()

        /* Remove edge */
        // Vertices 1, 3 i.e., v[0], v[1]
        graph.removeEdge(vet1: v[0], vet2: v[1])
        print("\nAfter removing edge 1-3, the graph is")
        graph.print()

        /* Add vertex */
        let v5 = Vertex(val: 6)
        graph.addVertex(vet: v5)
        print("\nAfter adding vertex 6, the graph is")
        graph.print()

        /* Remove vertex */
        // Vertex 3 i.e., v[1]
        graph.removeVertex(vet: v[1])
        print("\nAfter removing vertex 3, the graph is")
        graph.print()
    }
}

#endif
