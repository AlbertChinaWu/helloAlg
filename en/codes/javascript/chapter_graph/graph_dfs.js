/**
 * File: graph_dfs.js
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { Vertex } = require('../modules/Vertex');
const { GraphAdjList } = require('./graph_adjacency_list');

/* Depth-first traversal */
// Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
function dfs(graph, visited, res, vet) {
    res.push(vet); // Record visited vertex
    visited.add(vet); // Mark the vertex as visited
    // Traverse all adjacent vertices of that vertex
    for (const adjVet of graph.adjList.get(vet)) {
        if (visited.has(adjVet)) {
            continue; // Skip already visited vertices
        }
        // Recursively visit adjacent vertices
        dfs(graph, visited, res, adjVet);
    }
}

/* Depth-first traversal */
// Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
function graphDFS(graph, startVet) {
    // Vertex traversal sequence
    const res = [];
    // Hash set, used to record visited vertices
    const visited = new Set();
    dfs(graph, visited, res, startVet);
    return res;
}

/* Driver Code */
/* Initialize undirected graph */
const v = Vertex.valsToVets([0, 1, 2, 3, 4, 5, 6]);
const edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[2], v[5]],
    [v[4], v[5]],
    [v[5], v[6]],
];
const graph = new GraphAdjList(edges);
console.log('\nAfter initialization, the graph is');
graph.print();

/* Depth-first traversal */
const res = graphDFS(graph, v[0]);
console.log('\nDepth-first traversal (DFS) vertex sequence is');
console.log(Vertex.vetsToVals(res));
