/**
 * File: hanota.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.hanota

/* Move a disc */
fun move(src: MutableList<Int>, tar: MutableList<Int>) {
    // Take out a disc from the top of src
    val pan = src.removeAt(src.size - 1)
    // Place the disc on top of tar
    tar.add(pan)
}

/* Solve the Tower of Hanoi problem f(i) */
fun dfs(i: Int, src: MutableList<Int>, buf: MutableList<Int>, tar: MutableList<Int>) {
    // If only one disc remains on src, move it to tar
    if (i == 1) {
        move(src, tar)
        return
    }
    // Subproblem f(i-1): move the top i-1 discs from src with the help of tar to buf
    dfs(i - 1, src, tar, buf)
    // Subproblem f(1): move the remaining one disc from src to tar
    move(src, tar)
    // Subproblem f(i-1): move the top i-1 discs from buf with the help of src to tar
    dfs(i - 1, buf, src, tar)
}

/* Solve the Tower of Hanoi problem */
fun solveHanota(A: MutableList<Int>, B: MutableList<Int>, C: MutableList<Int>) {
    val n = A.size
    // Move the top n discs from A with the help of B to C
    dfs(n, A, B, C)
}

/* Driver Code */
fun main() {
    // The tail of the list is the top of the pillar
    val A = mutableListOf(5, 4, 3, 2, 1)
    val B = mutableListOf<Int>()
    val C = mutableListOf<Int>()
    println("Initial state:")
    println("A = $A")
    println("B = $B")
    println("C = $C")

    solveHanota(A, B, C)

    println("After the discs are moved:")
    println("A = $A")
    println("B = $B")
    println("C = $C")
}