/**
 * File: worst_best_time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.worst_best_time_complexity

/* Generate an array with elements {1, 2, ..., n} in a randomly shuffled order */
fun randomNumbers(n: Int): Array<Int?> {
    val nums = IntArray(n)
    // Generate array nums = { 1, 2, 3, ..., n }
    for (i in 0..<n) {
        nums[i] = i + 1
    }
    // Randomly shuffle array elements
    nums.shuffle()
    val res = arrayOfNulls<Int>(n)
    for (i in 0..<n) {
        res[i] = nums[i]
    }
    return res
}

/* Find the index of number 1 in array nums */
fun findOne(nums: Array<Int?>): Int {
    for (i in nums.indices) {
        // When element 1 is at the start of the array, achieve best time complexity O(1)
        // When element 1 is at the end of the array, achieve worst time complexity O(n)
        if (nums[i] == 1)
            return i
    }
    return -1
}

/* Driver Code */
fun main() {
    for (i in 0..9) {
        val n = 100
        val nums = randomNumbers(n)
        val index = findOne(nums)
        println("\nArray [ 1, 2, ..., n ] shuffled = ${nums.contentToString()}")
        println("Index of number 1 = $index")
    }
}