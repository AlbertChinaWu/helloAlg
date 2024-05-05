/**
 * File: subset_sum_i.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking algorithm: Subset Sum I */
func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
    // When the subset sum equals target, record the solution
    if target == 0 {
        res.append(state)
        return
    }
    // Traverse all choices
    // Pruning two: start traversing from start to avoid generating duplicate subsets
    for i in choices.indices.dropFirst(start) {
        // Pruning one: if the subset sum exceeds target, end the loop immediately
        // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
        if target - choices[i] < 0 {
            break
        }
        // Attempt: make a choice, update target, start
        state.append(choices[i])
        // Proceed to the next round of selection
        backtrack(state: &state, target: target - choices[i], choices: choices, start: i, res: &res)
        // Retract: undo the choice, restore to the previous state
        state.removeLast()
    }
}

/* Solve Subset Sum I */
func subsetSumI(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // State (subset)
    let nums = nums.sorted() // Sort nums
    let start = 0 // Start point for traversal
    var res: [[Int]] = [] // Result list (subset list)
    backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
    return res
}

@main
enum SubsetSumI {
    /* Driver Code */
    static func main() {
        let nums = [3, 4, 5]
        let target = 9

        let res = subsetSumI(nums: nums, target: target)

        print("Input array nums = \(nums), target = \(target)")
        print("All subsets summing to \(target) res = \(res)")
    }
}
