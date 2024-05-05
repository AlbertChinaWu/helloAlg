/**
 * File: binary_search_insertion.ts
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Binary search for insertion point (no duplicate elements) */
function binarySearchInsertionSimple(
    nums: Array<number>,
    target: number
): number {
    let i = 0,
        j = nums.length - 1; // Initialize double closed interval [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // Calculate the midpoint index m, using Math.floor() to round down
        if (nums[m] < target) {
            i = m + 1; // Target is in interval [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // Target is in interval [i, m-1]
        } else {
            return m; // Found target, return insertion point m
        }
    }
    // Did not find target, return insertion point i
    return i;
}

/* Binary search for insertion point (with duplicate elements) */
function binarySearchInsertion(nums: Array<number>, target: number): number {
    let i = 0,
        j = nums.length - 1; // Initialize double closed interval [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // Calculate the midpoint index m, using Math.floor() to round down
        if (nums[m] < target) {
            i = m + 1; // Target is in interval [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // Target is in interval [i, m-1]
        } else {
            j = m - 1; // First element less than target is in interval [i, m-1]
        }
    }
    // Return insertion point i
    return i;
}

/* Driver Code */
// Array without duplicate elements
let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
console.log('\nArray nums =' + nums);
// Binary search for insertion point
for (const target of [6, 9]) {
    const index = binarySearchInsertionSimple(nums, target);
    console.log('The insertion point index for element ' + target + ' is ' + index);
}

// Array with duplicate elements
nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\nArray nums =' + nums);
// Binary search for insertion point
for (const target of [2, 6, 20]) {
    const index = binarySearchInsertion(nums, target);
    console.log('The insertion point index for element ' + target + ' is ' + index);
}

export { binarySearchInsertion };
