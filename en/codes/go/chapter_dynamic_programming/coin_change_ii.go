// File: coin_change_ii.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Coin change II: Dynamic programming */
func coinChangeIIDP(coins []int, amt int) int {
	n := len(coins)
	// Initialize dp table
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, amt+1)
	}
	// Initialize first column
	for i := 0; i <= n; i++ {
		dp[i][0] = 1
	}
	// State transition: the rest of the rows and columns
	for i := 1; i <= n; i++ {
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// If exceeding the target amount, do not choose coin i
				dp[i][a] = dp[i-1][a]
			} else {
				// The sum of the two options of not choosing and choosing coin i
				dp[i][a] = dp[i-1][a] + dp[i][a-coins[i-1]]
			}
		}
	}
	return dp[n][amt]
}

/* Coin change II: Space-optimized dynamic programming */
func coinChangeIIDPComp(coins []int, amt int) int {
	n := len(coins)
	// Initialize dp table
	dp := make([]int, amt+1)
	dp[0] = 1
	// State transition
	for i := 1; i <= n; i++ {
		// Traverse in order
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// If exceeding the target amount, do not choose coin i
				dp[a] = dp[a]
			} else {
				// The sum of the two options of not choosing and choosing coin i
				dp[a] = dp[a] + dp[a-coins[i-1]]
			}
		}
	}
	return dp[amt]
}
