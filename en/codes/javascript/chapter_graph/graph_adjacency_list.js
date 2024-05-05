/**
 * File: graph_adjacency_list.js
 * Created Time: 2023-02-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { Vertex } = require('../modules/Vertex');

/* Undirected graph class based on adjacency list */
class GraphAdjList {
    // Adjacency list, key: vertex, value: all adjacent vertices of that vertex
    adjList;

    /* Constructor */
    constructor(edges) {
        this.adjList = new Map();
        // Add all vertices and edges
        for (const edge of edges) {
            this.addVertex(edge[0]);
            this.addVertex(edge[1]);
            this.addEdge(edge[0], edge[1]);
        }
    }

    /* Get the number of vertices */
    size() {
        return this.adjList.size;
    }

    /* Add edge */
    addEdge(vet1, vet2) {
        if (
            !this.adjList.has(vet1) ||
            !this.adjList.has(vet2) ||
            vet1 === vet2
        ) {
            throw new Error('Illegal Argument Exception');
        }
        // Add edge vet1 - vet2
        this.adjList.get(vet1).push(vet2);
        this.adjList.get(vet2).push(vet1);
    }

    /* Remove edge */
    removeEdge(vet1, vet2) {
        if (
            !this.adjList.has(vet1) ||
            !this.adjList.has(vet2) ||
            vet1 === vet2
        ) {
            throw new Error('Illegal Argument Exception');
        }
        // Remove edge vet1 - vet2
        this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
        this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
    }

    /* Add vertex */
    addVertex(vet) {
        if (this.adjList.has(vet)) return;
        // Add a new linked list to the adjacency list
        this.adjList.set(vet, []);
    }

    /* Remove vertex */
    removeVertex(vet) {
        if (!this.adjList.has(vet)) {
            throw new Error('Illegal Argument Exception');
        }
        // Remove the vertex vet's corresponding linked list from the adjacency list
        this.adjList.delete(vet);
        // Traverse other vertices' linked lists, removing all edges containing vet
        for (const set of this.adjList.values()) {
            const index = set.indexOf(vet);
            if (index > -1) {
                set.splice(index, 1);
            }
        }
    }

    /* Print the adjacency list */
    print() {
        console.log('Adjacency list =');
        for (const [key, value] of this.adjList) {
            const tmp = [];
            for (const vertex of value) {
                tmp.push(vertex.val);
            }
            console.log(key.val + ': ' + tmp.join());
        }
    }
}

if (require.main === module) {
    /* Driver Code */
    /* Initialize undirected graph */
    const v0 = new Vertex(1),
        v1 = new Vertex(3),
        v2 = new Vertex(2),
        v3 = new Vertex(5),
        v4 = new Vertex(4);
    const edges = [
        [v0, v1],
        [v1, v2],
        [v2, v3],
        [v0, v3],
        [v2, v4],
        [v3, v4],
    ];
    const graph = new GraphAdjList(edges);
    console.log('\nAfter initialization, the graph is');
    graph.print();

    /* Add edge */
    // Vertices 1, 2 are v0, v2
    graph.addEdge(v0, v2);
    console.log('\nAfter adding edge 1-2, the graph is');
    graph.print();

    /* Remove edge */
    // Vertices 1, 3, are v0, v1
    graph.removeEdge(v0, v1);
    console.log('\nAfter removing edge 1-3, the graph is');
    graph.print();

    /* Add vertex */
    const v5 = new Vertex(6);
    graph.addVertex(v5);
    console.log('\nAfter adding vertex 6, the graph is');
    graph.print();

    /* Remove vertex */
    // Vertex 3 is v1
    graph.removeVertex(v1);
    console.log('\nAfter removing vertex 3, the graph is');
    graph.print();
}

module.exports = {
    GraphAdjList,
};
