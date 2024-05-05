/**
 * File: knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.max

/* 0-1 Knapsack: Brute force search */
fun knapsackDFS(
    wgt: IntArray,
    _val: IntArray,
    i: Int,
    c: Int
): Int {
    // If all items have been chosen or the knapsack has no remaining capacity, return value 0
    if (i == 0 || c == 0) {
        return 0
    }
    // If exceeding the knapsack capacity, can only choose not to put it in the knapsack
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, _val, i - 1, c)
    }
    // Calculate the maximum value of not putting in and putting in item i
    val no = knapsackDFS(wgt, _val, i - 1, c)
    val yes = knapsackDFS(wgt, _val, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // Return the greater value of the two options
    return max(no, yes)
}

/* 0-1 Knapsack: Memoized search */
fun knapsackDFSMem(
    wgt: IntArray,
    _val: IntArray,
    mem: Array<IntArray>,
    i: Int,
    c: Int
): Int {
    // If all items have been chosen or the knapsack has no remaining capacity, return value 0
    if (i == 0 || c == 0) {
        return 0
    }
    // If there is a record, return it
    if (mem[i][c] != -1) {
        return mem[i][c]
    }
    // If exceeding the knapsack capacity, can only choose not to put it in the knapsack
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, _val, mem, i - 1, c)
    }
    // Calculate the maximum value of not putting in and putting in item i
    val no = knapsackDFSMem(wgt, _val, mem, i - 1, c)
    val yes = knapsackDFSMem(wgt, _val, mem, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // Record and return the greater value of the two options
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* 0-1 Knapsack: Dynamic programming */
fun knapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // Initialize dp table
    val dp = Array(n + 1) { IntArray(cap + 1) }
    // State transition
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // If exceeding the knapsack capacity, do not choose item i
                dp[i][c] = dp[i - 1][c]
            } else {
                // The greater value between not choosing and choosing item i
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 0-1 Knapsack: Space-optimized dynamic programming */
fun knapsackDPComp(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // Initialize dp table
    val dp = IntArray(cap + 1)
    // State transition
    for (i in 1..n) {
        // Traverse in reverse order
        for (c in cap downTo 1) {
            if (wgt[i - 1] <= c) {
                // The greater value between not choosing and choosing item i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[cap]
}

/* Driver Code */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50
    val n = wgt.size

    // Brute force search
    var res = knapsackDFS(wgt, _val, n, cap)
    println("Maximum value of items without exceeding bag capacity = $res")

    // Memoized search
    val mem = Array(n + 1) { IntArray(cap + 1) }
    for (row in mem) {
        row.fill(-1)
    }
    res = knapsackDFSMem(wgt, _val, mem, n, cap)
    println("Maximum value of items without exceeding bag capacity = $res")

    // Dynamic programming
    res = knapsackDP(wgt, _val, cap)
    println("Maximum value of items without exceeding bag capacity = $res")

    // Space-optimized dynamic programming
    res = knapsackDPComp(wgt, _val, cap)
    println("Maximum value of items without exceeding bag capacity = $res")
}