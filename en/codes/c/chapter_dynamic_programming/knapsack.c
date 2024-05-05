/**
 * File: knapsack.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Find maximum value */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* 0-1 Knapsack: Brute force search */
int knapsackDFS(int wgt[], int val[], int i, int c) {
    // If all items have been chosen or the knapsack has no remaining capacity, return value 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // If exceeding the knapsack capacity, can only choose not to put it in the knapsack
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // Calculate the maximum value of not putting in and putting in item i
    int no = knapsackDFS(wgt, val, i - 1, c);
    int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Return the greater value of the two options
    return myMax(no, yes);
}

/* 0-1 Knapsack: Memoized search */
int knapsackDFSMem(int wgt[], int val[], int memCols, int **mem, int i, int c) {
    // If all items have been chosen or the knapsack has no remaining capacity, return value 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // If there is a record, return it
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // If exceeding the knapsack capacity, can only choose not to put it in the knapsack
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
    }
    // Calculate the maximum value of not putting in and putting in item i
    int no = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
    int yes = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Record and return the greater value of the two options
    mem[i][c] = myMax(no, yes);
    return mem[i][c];
}

/* 0-1 Knapsack: Dynamic programming */
int knapsackDP(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // Initialize dp table
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(cap + 1, sizeof(int));
    }
    // State transition
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // If exceeding the knapsack capacity, do not choose item i
                dp[i][c] = dp[i - 1][c];
            } else {
                // The greater value between not choosing and choosing item i
                dp[i][c] = myMax(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[n][cap];
    // Free memory
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    return res;
}

/* 0-1 Knapsack: Space-optimized dynamic programming */
int knapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // Initialize dp table
    int *dp = calloc(cap + 1, sizeof(int));
    // State transition
    for (int i = 1; i <= n; i++) {
        // Traverse in reverse order
        for (int c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // The greater value between not choosing and choosing item i
                dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[cap];
    // Free memory
    free(dp);
    return res;
}

/* Driver Code */
int main() {
    int wgt[] = {10, 20, 30, 40, 50};
    int val[] = {50, 120, 150, 210, 240};
    int cap = 50;
    int n = sizeof(wgt) / sizeof(wgt[0]);
    int wgtSize = n;

    // Brute force search
    int res = knapsackDFS(wgt, val, n, cap);
    printf("Maximum value of items without exceeding bag capacity = %d\n", res);

    // Memoized search
    int **mem = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        mem[i] = malloc((cap + 1) * sizeof(int));
        memset(mem[i], -1, (cap + 1) * sizeof(int));
    }
    res = knapsackDFSMem(wgt, val, cap + 1, mem, n, cap);
    printf("Maximum value of items without exceeding bag capacity = %d\n", res);
    // Free memory
    for (int i = 0; i <= n; i++) {
        free(mem[i]);
    }
    free(mem);

    // Dynamic programming
    res = knapsackDP(wgt, val, cap, wgtSize);
    printf("Maximum value of items without exceeding bag capacity = %d\n", res);

    // Space-optimized dynamic programming
    res = knapsackDPComp(wgt, val, cap, wgtSize);
    printf("Maximum value of items without exceeding bag capacity = %d\n", res);

    return 0;
}
