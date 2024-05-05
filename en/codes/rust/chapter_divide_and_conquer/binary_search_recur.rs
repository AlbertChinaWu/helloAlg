/*
 * File: binary_search_recur.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* Binary search: problem f(i, j) */
fn dfs(nums: &[i32], target: i32, i: i32, j: i32) -> i32 {
    // If the interval is empty, indicating no target element, return -1
    if i > j {
        return -1;
    }
    let m: i32 = (i + j) / 2;
    if nums[m as usize] < target {
        // Recursive subproblem f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if nums[m as usize] > target {
        // Recursive subproblem f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // Found the target element, thus return its index
        return m;
    }
}

/* Binary search */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    let n = nums.len() as i32;
    // Solve problem f(0, n-1)
    dfs(nums, target, 0, n - 1)
}

/* Driver Code */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // Binary search (double closed interval)
    let index = binary_search(&nums, target);
    println!("The index of target element 6 is {index}");
}
