// File: unbounded_knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* Complete knapsack: Dynamic programming */
func unboundedKnapsackDP(wgt, val []int, cap int) int {
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
				dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i][c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[n][cap]
}

/* Complete knapsack: Space-optimized dynamic programming */
func unboundedKnapsackDPComp(wgt, val []int, cap int) int {
	n := len(wgt)
	// Initialize dp table
	dp := make([]int, cap+1)
	// State transition
	for i := 1; i <= n; i++ {
		for c := 1; c <= cap; c++ {
			if wgt[i-1] > c {
				// If exceeding the knapsack capacity, do not choose item i
				dp[c] = dp[c]
			} else {
				// The greater value between not choosing and choosing item i
				dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[cap]
}
