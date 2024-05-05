/**
 * File: climbing_stairs_dp.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Climbing stairs: Dynamic programming */
function climbingStairsDP(n) {
    if (n === 1 || n === 2) return n;
    // Initialize dp table, used to store subproblem solutions
    const dp = new Array(n + 1).fill(-1);
    // Initial state: preset the smallest subproblem solution
    dp[1] = 1;
    dp[2] = 2;
    // State transition: gradually solve larger subproblems from smaller ones
    for (let i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* Climbing stairs: Space-optimized dynamic programming */
function climbingStairsDPComp(n) {
    if (n === 1 || n === 2) return n;
    let a = 1,
        b = 2;
    for (let i = 3; i <= n; i++) {
        const tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

/* Driver Code */
const n = 9;
let res = climbingStairsDP(n);
console.log(`爬 ${n} 阶楼梯共有 ${res} 种方案`);
res = climbingStairsDPComp(n);
console.log(`爬 ${n} 阶楼梯共有 ${res} 种方案`);
