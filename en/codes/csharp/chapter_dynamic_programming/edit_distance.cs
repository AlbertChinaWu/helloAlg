﻿/**
* File: edit_distance.cs
* Created Time: 2023-07-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class edit_distance {
    /* Edit distance: Brute force search */
    int EditDistanceDFS(string s, string t, int i, int j) {
        // If both s and t are empty, return 0
        if (i == 0 && j == 0)
            return 0;
        // If s is empty, return the length of t
        if (i == 0)
            return j;
        // If t is empty, return the length of s
        if (j == 0)
            return i;
        // If the two characters are equal, skip these two characters
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFS(s, t, i - 1, j - 1);
        // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
        int insert = EditDistanceDFS(s, t, i, j - 1);
        int delete = EditDistanceDFS(s, t, i - 1, j);
        int replace = EditDistanceDFS(s, t, i - 1, j - 1);
        // Return the minimum number of edits
        return Math.Min(Math.Min(insert, delete), replace) + 1;
    }

    /* Edit distance: Memoized search */
    int EditDistanceDFSMem(string s, string t, int[][] mem, int i, int j) {
        // If both s and t are empty, return 0
        if (i == 0 && j == 0)
            return 0;
        // If s is empty, return the length of t
        if (i == 0)
            return j;
        // If t is empty, return the length of s
        if (j == 0)
            return i;
        // If there is a record, return it
        if (mem[i][j] != -1)
            return mem[i][j];
        // If the two characters are equal, skip these two characters
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
        int insert = EditDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = EditDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // Record and return the minimum number of edits
        mem[i][j] = Math.Min(Math.Min(insert, delete), replace) + 1;
        return mem[i][j];
    }

    /* Edit distance: Dynamic programming */
    int EditDistanceDP(string s, string t) {
        int n = s.Length, m = t.Length;
        int[,] dp = new int[n + 1, m + 1];
        // State transition: first row and first column
        for (int i = 1; i <= n; i++) {
            dp[i, 0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0, j] = j;
        }
        // State transition: the rest of the rows and columns
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // If the two characters are equal, skip these two characters
                    dp[i, j] = dp[i - 1, j - 1];
                } else {
                    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                    dp[i, j] = Math.Min(Math.Min(dp[i, j - 1], dp[i - 1, j]), dp[i - 1, j - 1]) + 1;
                }
            }
        }
        return dp[n, m];
    }

    /* Edit distance: Space-optimized dynamic programming */
    int EditDistanceDPComp(string s, string t) {
        int n = s.Length, m = t.Length;
        int[] dp = new int[m + 1];
        // State transition: first row
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // State transition: the rest of the rows
        for (int i = 1; i <= n; i++) {
            // State transition: first column
            int leftup = dp[0]; // Temporarily store dp[i-1, j-1]
            dp[0] = i;
            // State transition: the rest of the columns
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // If the two characters are equal, skip these two characters
                    dp[j] = leftup;
                } else {
                    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                    dp[j] = Math.Min(Math.Min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // Update for the next round of dp[i-1, j-1]
            }
        }
        return dp[m];
    }

    [Test]
    public void Test() {
        string s = "bag";
        string t = "pack";
        int n = s.Length, m = t.Length;

        // Brute force search
        int res = EditDistanceDFS(s, t, n, m);
        Console.WriteLine("Changing " + s + " to " + t + " requires a minimum of " + res + " edits");

        // Memoized search
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[m + 1];
            Array.Fill(mem[i], -1);
        }

        res = EditDistanceDFSMem(s, t, mem, n, m);
        Console.WriteLine("Changing " + s + " to " + t + " requires a minimum of " + res + " edits");

        // Dynamic programming
        res = EditDistanceDP(s, t);
        Console.WriteLine("Changing " + s + " to " + t + " requires a minimum of " + res + " edits");

        // Space-optimized dynamic programming
        res = EditDistanceDPComp(s, t);
        Console.WriteLine("Changing " + s + " to " + t + " requires a minimum of " + res + " edits");
    }
}
