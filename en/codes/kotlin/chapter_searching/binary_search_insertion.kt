/**
 * File: binary_search_insertion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Binary search for insertion point (no duplicate elements) */
fun binarySearchInsertionSimple(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // Initialize double closed interval [0, n-1]
    while (i <= j) {
        val m = i + (j - i) / 2 // Calculate midpoint index m
        if (nums[m] < target) {
            i = m + 1 // Target is in interval [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1 // Target is in interval [i, m-1]
        } else {
            return m // Found target, return insertion point m
        }
    }
    // Did not find target, return insertion point i
    return i
}

/* Binary search for insertion point (with duplicate elements) */
fun binarySearchInsertion(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // Initialize double closed interval [0, n-1]
    while (i <= j) {
        val m = i + (j - i) / 2 // Calculate midpoint index m
        if (nums[m] < target) {
            i = m + 1 // Target is in interval [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1 // Target is in interval [i, m-1]
        } else {
            j = m - 1 // First element less than target is in interval [i, m-1]
        }
    }
    // Return insertion point i
    return i
}

/* Driver Code */
fun main() {
    // Array without duplicate elements
    var nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)
    println("\nArray nums = ${nums.contentToString()}")
    // Binary search for insertion point
    for (target in intArrayOf(6, 9)) {
        val index = binarySearchInsertionSimple(nums, target)
        println("Index of the insertion point for element $target = $index")
    }

    // Array with duplicate elements
    nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\nArray nums = ${nums.contentToString()}")

    // Binary search for insertion point
    for (target in intArrayOf(2, 6, 20)) {
        val index = binarySearchInsertion(nums, target)
        println("Index of the insertion point for element $target = $index")
    }
}