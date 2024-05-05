/**
 * File: selection_sort.ts
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* Selection sort */
function selectionSort(nums: number[]): void {
    let n = nums.length;
    // Outer loop: unsorted range is [i, n-1]
    for (let i = 0; i < n - 1; i++) {
        // Inner loop: find the smallest element within the unsorted range
        let k = i;
        for (let j = i + 1; j < n; j++) {
            if (nums[j] < nums[k]) {
                k = j; // Record the index of the smallest element
            }
        }
        // Swap the smallest element with the first element of the unsorted range
        [nums[i], nums[k]] = [nums[k], nums[i]];
    }
}

/* Driver Code */
const nums: number[] = [4, 1, 3, 1, 5, 2];
selectionSort(nums);
console.log('Selection sort completed nums =', nums);

export {};
