/**
 * File: climbing_stairs_dfs_mem.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Memoized search */
fun dfs(i: Int, mem: IntArray): Int {
    // Known dp[1] and dp[2], return them
    if (i == 1 || i == 2) return i
    // If there is a record for dp[i], return it
    if (mem[i] != -1) return mem[i]
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1, mem) + dfs(i - 2, mem)
    // Record dp[i]
    mem[i] = count
    return count
}

/* Climbing stairs: Memoized search */
fun climbingStairsDFSMem(n: Int): Int {
    // mem[i] records the total number of solutions for climbing to the ith step, -1 means no record
    val mem = IntArray(n + 1)
    mem.fill(-1)
    return dfs(n, mem)
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsDFSMem(n)
    println("There are $res solutions to climb $n stairs")
}