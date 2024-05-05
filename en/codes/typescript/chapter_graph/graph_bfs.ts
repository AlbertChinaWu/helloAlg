/**
 * File: graph_bfs.ts
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { GraphAdjList } from './graph_adjacency_list';
import { Vertex } from '../modules/Vertex';

/* Breadth-first traversal */
// Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
function graphBFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
    // Vertex traversal sequence
    const res: Vertex[] = [];
    // Hash set, used to record visited vertices
    const visited: Set<Vertex> = new Set();
    visited.add(startVet);
    // Queue used to implement BFS
    const que = [startVet];
    // Starting from vertex vet, loop until all vertices are visited
    while (que.length) {
        const vet = que.shift(); // Dequeue the vertex at the head of the queue
        res.push(vet); // Record visited vertex
        // Traverse all adjacent vertices of that vertex
        for (const adjVet of graph.adjList.get(vet) ?? []) {
            if (visited.has(adjVet)) {
                continue; // Skip already visited vertices
            }
            que.push(adjVet); // Only enqueue if not visited
            visited.add(adjVet); // Mark the vertex as visited
        }
    }
    // Return the vertex traversal sequence
    return res;
}

/* Driver Code */
/* Initialize undirected graph */
const v = Vertex.valsToVets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
const edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[1], v[4]],
    [v[2], v[5]],
    [v[3], v[4]],
    [v[3], v[6]],
    [v[4], v[5]],
    [v[4], v[7]],
    [v[5], v[8]],
    [v[6], v[7]],
    [v[7], v[8]],
];
const graph = new GraphAdjList(edges);
console.log('\nAfter initialization, the graph is');
graph.print();

/* Breadth-first traversal */
const res = graphBFS(graph, v[0]);
console.log('\nBreadth-first traversal (BFS) vertex sequence is');
console.log(Vertex.vetsToVals(res));
