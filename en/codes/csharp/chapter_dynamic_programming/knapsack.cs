﻿/**
* File: knapsack.cs
* Created Time: 2023-07-07
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class knapsack {
    /* 0-1 Knapsack: Brute force search */
    int KnapsackDFS(int[] weight, int[] val, int i, int c) {
        // If all items have been chosen or the knapsack has no remaining capacity, return value 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // If exceeding the knapsack capacity, can only choose not to put it in the knapsack
        if (weight[i - 1] > c) {
            return KnapsackDFS(weight, val, i - 1, c);
        }
        // Calculate the maximum value of not putting in and putting in item i
        int no = KnapsackDFS(weight, val, i - 1, c);
        int yes = KnapsackDFS(weight, val, i - 1, c - weight[i - 1]) + val[i - 1];
        // Return the greater value of the two options
        return Math.Max(no, yes);
    }

    /* 0-1 Knapsack: Memoized search */
    int KnapsackDFSMem(int[] weight, int[] val, int[][] mem, int i, int c) {
        // If all items have been chosen or the knapsack has no remaining capacity, return value 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // If there is a record, return it
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // If exceeding the knapsack capacity, can only choose not to put it in the knapsack
        if (weight[i - 1] > c) {
            return KnapsackDFSMem(weight, val, mem, i - 1, c);
        }
        // Calculate the maximum value of not putting in and putting in item i
        int no = KnapsackDFSMem(weight, val, mem, i - 1, c);
        int yes = KnapsackDFSMem(weight, val, mem, i - 1, c - weight[i - 1]) + val[i - 1];
        // Record and return the greater value of the two options
        mem[i][c] = Math.Max(no, yes);
        return mem[i][c];
    }

    /* 0-1 Knapsack: Dynamic programming */
    int KnapsackDP(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // Initialize dp table
        int[,] dp = new int[n + 1, cap + 1];
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (weight[i - 1] > c) {
                    // If exceeding the knapsack capacity, do not choose item i
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // The greater value between not choosing and choosing item i
                    dp[i, c] = Math.Max(dp[i - 1, c - weight[i - 1]] + val[i - 1], dp[i - 1, c]);
                }
            }
        }
        return dp[n, cap];
    }

    /* 0-1 Knapsack: Space-optimized dynamic programming */
    int KnapsackDPComp(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // Initialize dp table
        int[] dp = new int[cap + 1];
        // State transition
        for (int i = 1; i <= n; i++) {
            // Traverse in reverse order
            for (int c = cap; c > 0; c--) {
                if (weight[i - 1] > c) {
                    // If exceeding the knapsack capacity, do not choose item i
                    dp[c] = dp[c];
                } else {
                    // The greater value between not choosing and choosing item i
                    dp[c] = Math.Max(dp[c], dp[c - weight[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    [Test]
    public void Test() {
        int[] weight = [10, 20, 30, 40, 50];
        int[] val = [50, 120, 150, 210, 240];
        int cap = 50;
        int n = weight.Length;

        // Brute force search
        int res = KnapsackDFS(weight, val, n, cap);
        Console.WriteLine("The maximum value within the bag capacity is" + res);

        // Memoized search
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[cap + 1];
            Array.Fill(mem[i], -1);
        }
        res = KnapsackDFSMem(weight, val, mem, n, cap);
        Console.WriteLine("The maximum value within the bag capacity is" + res);

        // Dynamic programming
        res = KnapsackDP(weight, val, cap);
        Console.WriteLine("The maximum value within the bag capacity is" + res);

        // Space-optimized dynamic programming
        res = KnapsackDPComp(weight, val, cap);
        Console.WriteLine("The maximum value within the bag capacity is" + res);
    }
}
