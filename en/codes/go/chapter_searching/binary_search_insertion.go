// File: binary_search_insertion.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* Binary search for insertion point (no duplicate elements) */
func binarySearchInsertionSimple(nums []int, target int) int {
	// Initialize double closed interval [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// Calculate midpoint index m
		m := i + (j-i)/2
		if nums[m] < target {
			// Target is in interval [m+1, j]
			i = m + 1
		} else if nums[m] > target {
			// Target is in interval [i, m-1]
			j = m - 1
		} else {
			// Found target, return insertion point m
			return m
		}
	}
	// Did not find target, return insertion point i
	return i
}

/* Binary search for insertion point (with duplicate elements) */
func binarySearchInsertion(nums []int, target int) int {
	// Initialize double closed interval [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// Calculate midpoint index m
		m := i + (j-i)/2
		if nums[m] < target {
			// Target is in interval [m+1, j]
			i = m + 1
		} else if nums[m] > target {
			// Target is in interval [i, m-1]
			j = m - 1
		} else {
			// First element less than target is in interval [i, m-1]
			j = m - 1
		}
	}
	// Return insertion point i
	return i
}
