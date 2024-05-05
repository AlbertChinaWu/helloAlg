﻿/**
* File: unbounded_knapsack.cs
* Created Time: 2023-07-12
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class unbounded_knapsack {
    /* Complete knapsack: Dynamic programming */
    int UnboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // Initialize dp table
        int[,] dp = new int[n + 1, cap + 1];
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If exceeding the knapsack capacity, do not choose item i
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // The greater value between not choosing and choosing item i
                    dp[i, c] = Math.Max(dp[i - 1, c], dp[i, c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n, cap];
    }

    /* Complete knapsack: Space-optimized dynamic programming */
    int UnboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // Initialize dp table
        int[] dp = new int[cap + 1];
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If exceeding the knapsack capacity, do not choose item i
                    dp[c] = dp[c];
                } else {
                    // The greater value between not choosing and choosing item i
                    dp[c] = Math.Max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    [Test]
    public void Test() {
        int[] wgt = [1, 2, 3];
        int[] val = [5, 11, 15];
        int cap = 4;

        // Dynamic programming
        int res = UnboundedKnapsackDP(wgt, val, cap);
        Console.WriteLine("The maximum value within the bag capacity is" + res);

        // Space-optimized dynamic programming
        res = UnboundedKnapsackDPComp(wgt, val, cap);
        Console.WriteLine("The maximum value within the bag capacity is" + res);
    }
}
