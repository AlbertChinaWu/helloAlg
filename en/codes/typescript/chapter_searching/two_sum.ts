/**
 * File: two_sum.ts
 * Created Time: 2022-12-15
 * Author: gyt95 (gytkwan@gmail.com)
 */

/* Method one: Brute force enumeration */
function twoSumBruteForce(nums: number[], target: number): number[] {
    const n = nums.length;
    // Two-layer loop, time complexity is O(n^2)
    for (let i = 0; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            if (nums[i] + nums[j] === target) {
                return [i, j];
            }
        }
    }
    return [];
}

/* Method two: Auxiliary hash table */
function twoSumHashTable(nums: number[], target: number): number[] {
    // Auxiliary hash table, space complexity is O(n)
    let m: Map<number, number> = new Map();
    // Single-layer loop, time complexity is O(n)
    for (let i = 0; i < nums.length; i++) {
        let index = m.get(target - nums[i]);
        if (index !== undefined) {
            return [index, i];
        } else {
            m.set(nums[i], i);
        }
    }
    return [];
}

/* Driver Code */
// Method one
const nums = [2, 7, 11, 15],
    target = 13;

let res = twoSumBruteForce(nums, target);
console.log('Method one res =', res);

// Method two
res = twoSumHashTable(nums, target);
console.log('Method two res =', res);

export {};
