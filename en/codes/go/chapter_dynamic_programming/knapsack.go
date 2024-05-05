// File: knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* 0-1 Knapsack: Brute force search */
func knapsackDFS(wgt, val []int, i, c int) int {
	// If all items have been chosen or the knapsack has no remaining capacity, return value 0
	if i == 0 || c == 0 {
		return 0
	}
	// If exceeding the knapsack capacity, can only choose not to put it in the knapsack
	if wgt[i-1] > c {
		return knapsackDFS(wgt, val, i-1, c)
	}
	// Calculate the maximum value of not putting in and putting in item i
	no := knapsackDFS(wgt, val, i-1, c)
	yes := knapsackDFS(wgt, val, i-1, c-wgt[i-1]) + val[i-1]
	// Return the greater value of the two options
	return int(math.Max(float64(no), float64(yes)))
}

/* 0-1 Knapsack: Memoized search */
func knapsackDFSMem(wgt, val []int, mem [][]int, i, c int) int {
	// If all items have been chosen or the knapsack has no remaining capacity, return value 0
	if i == 0 || c == 0 {
		return 0
	}
	// If there is a record, return it
	if mem[i][c] != -1 {
		return mem[i][c]
	}
	// If exceeding the knapsack capacity, can only choose not to put it in the knapsack
	if wgt[i-1] > c {
		return knapsackDFSMem(wgt, val, mem, i-1, c)
	}
	// Calculate the maximum value of not putting in and putting in item i
	no := knapsackDFSMem(wgt, val, mem, i-1, c)
	yes := knapsackDFSMem(wgt, val, mem, i-1, c-wgt[i-1]) + val[i-1]
	// Return the greater value of the two options
	mem[i][c] = int(math.Max(float64(no), float64(yes)))
	return mem[i][c]
}

/* 0-1 Knapsack: Dynamic programming */
func knapsackDP(wgt, val []int, cap int) int {
	n := len(wgt)
	// Initialize dp table
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, cap+1)
	}
	// State transition
	for i := 1; i <= n; i++ {
		for c := 1; c <= cap; c++ {
			if wgt[i-1] > c {
				// If exceeding the knapsack capacity, do not choose item i
				dp[i][c] = dp[i-1][c]
			} else {
				// The greater value between not choosing and choosing item i
				dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i-1][c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[n][cap]
}

/* 0-1 Knapsack: Space-optimized dynamic programming */
func knapsackDPComp(wgt, val []int, cap int) int {
	n := len(wgt)
	// Initialize dp table
	dp := make([]int, cap+1)
	// State transition
	for i := 1; i <= n; i++ {
		// Traverse in reverse order
		for c := cap; c >= 1; c-- {
			if wgt[i-1] <= c {
				// The greater value between not choosing and choosing item i
				dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[cap]
}
