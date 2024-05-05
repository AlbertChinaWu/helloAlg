/**
 * File: graph_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex
import java.util.*

/* Breadth-first traversal */
// Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
fun graphBFS(graph: GraphAdjList, startVet: Vertex): MutableList<Vertex?> {
    // Vertex traversal sequence
    val res = mutableListOf<Vertex?>()
    // Hash set, used to record visited vertices
    val visited = HashSet<Vertex>()
    visited.add(startVet)
    // Queue used to implement BFS
    val que = LinkedList<Vertex>()
    que.offer(startVet)
    // Starting from vertex vet, loop until all vertices are visited
    while (!que.isEmpty()) {
        val vet = que.poll() // Dequeue the vertex at the head of the queue
        res.add(vet)         // Record visited vertex
        // Traverse all adjacent vertices of that vertex
        for (adjVet in graph.adjList[vet]!!) {
            if (visited.contains(adjVet))
                continue        // Skip already visited vertices
            que.offer(adjVet)   // Only enqueue unvisited vertices
            visited.add(adjVet) // Mark the vertex as visited
        }
    }
    // Return the vertex traversal sequence
    return res
}

/* Driver Code */
fun main() {
    /* Initialize undirected graph */
    val v = Vertex.valsToVets(intArrayOf(0, 1, 2, 3, 4, 5, 6, 7, 8, 9))
    val edges = arrayOf(
        arrayOf(v[0], v[1]),
        arrayOf(v[0], v[3]),
        arrayOf(v[1], v[2]),
        arrayOf(v[1], v[4]),
        arrayOf(v[2], v[5]),
        arrayOf(v[3], v[4]),
        arrayOf(v[3], v[6]),
        arrayOf(v[4], v[5]),
        arrayOf(v[4], v[7]),
        arrayOf(v[5], v[8]),
        arrayOf(v[6], v[7]),
        arrayOf(v[7], v[8])
    )
    val graph = GraphAdjList(edges)
    println("\nAfter initialization, the graph is")
    graph.print()

    /* Breadth-first traversal */
    val res = graphBFS(graph, v[0]!!)
    println("\nBreadth-first traversal (BFS) vertex sequence is")
    println(Vertex.vetsToVals(res))
}