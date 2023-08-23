/**
 * File: coin_change_ii.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 零钱兑换 II：动态规划 */
function coinChangeIIDP(coins: Array<number>, amt: number): number {
    let n: number = coins.length;
    // 初始化 dp 表
    let dp: Array<Array<number>> = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // 初始化首列
    for (let i: number = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // 状态转移
    for (let i: number = 1; i <= n; i++) {
        for (let a: number = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若超过背包容量，则不选硬币 i
                dp[i][a] = dp[i - 1][a];
            } else {
                // 不选和选硬币 i 这两种方案之和
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    return dp[n][amt];
}

/* 零钱兑换 II：状态压缩后的动态规划 */
function coinChangeIIDPComp(coins: Array<number>, amt: number): number {
    let n: number = coins.length;
    // 初始化 dp 表
    let dp: Array<number> = Array.from({ length: amt + 1 }, () => 0);
    dp[0] = 1;
    // 状态转移
    for (let i: number = 1; i <= n; i++) {
        for (let a: number = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若超过背包容量，则不选硬币 i
                dp[a] = dp[a];
            } else {
                // 不选和选硬币 i 这两种方案之和
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    return dp[amt];
}

/* Driver Code */
let coins: Array<number> = [1, 2, 5];
let amt: number = 5;

// 动态规划
let res: number = coinChangeIIDP(coins, amt);
console.log('凑出目标金额的硬币组合数量为 ' + res);

// 状态压缩后的动态规划
res = coinChangeIIDPComp(coins, amt);
console.log('凑出目标金额的硬币组合数量为 ' + res);

export {};
