/**
 * File : n_queens.c
 * Created Time: 2023-09-25
 * Author : lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* Backtracking algorithm: n queens */
void backtrack(int row, int n, char state[MAX_SIZE][MAX_SIZE], char ***res, int *resSize, bool cols[MAX_SIZE],
               bool diags1[2 * MAX_SIZE - 1], bool diags2[2 * MAX_SIZE - 1]) {
    // When all rows are placed, record the solution
    if (row == n) {
        res[*resSize] = (char **)malloc(sizeof(char *) * n);
        for (int i = 0; i < n; ++i) {
            res[*resSize][i] = (char *)malloc(sizeof(char) * (n + 1));
            strcpy(res[*resSize][i], state[i]);
        }
        (*resSize)++;
        return;
    }
    // Traverse all columns
    for (int col = 0; col < n; col++) {
        // Calculate the main and minor diagonals corresponding to the cell
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // Pruning: do not allow queens on the column, main diagonal, or minor diagonal of the cell
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Attempt: place the queen in the cell
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Place the next row
            backtrack(row + 1, n, state, res, resSize, cols, diags1, diags2);
            // Retract: restore the cell to an empty spot
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Solve n queens */
char ***nQueens(int n, int *returnSize) {
    char state[MAX_SIZE][MAX_SIZE];
    // Initialize an n*n size chessboard, where 'Q' represents the queen and '#' represents an empty spot
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            state[i][j] = '#';
        }
        state[i][n] = '\0';
    }
    bool cols[MAX_SIZE] = {false};           // Record columns with queens
    bool diags1[2 * MAX_SIZE - 1] = {false}; // Record main diagonals with queens
    bool diags2[2 * MAX_SIZE - 1] = {false}; // Record minor diagonals with queens

    char ***res = (char ***)malloc(sizeof(char **) * MAX_SIZE);
    *returnSize = 0;
    backtrack(0, n, state, res, returnSize, cols, diags1, diags2);
    return res;
}

/* Driver Code */
int main() {
    int n = 4;
    int returnSize;
    char ***res = nQueens(n, &returnSize);

    printf("Input chessboard dimensions as %d\n", n);
    printf("Total of %d queen placement solutions\n", returnSize);
    for (int i = 0; i < returnSize; ++i) {
        for (int j = 0; j < n; ++j) {
            printf("[");
            for (int k = 0; res[i][j][k] != '\0'; ++k) {
                printf("%c", res[i][j][k]);
                if (res[i][j][k + 1] != '\0') {
                    printf(", ");
                }
            }
            printf("]\n");
        }
        printf("---------------------\n");
    }

    // Free memory
    for (int i = 0; i < returnSize; ++i) {
        for (int j = 0; j < n; ++j) {
            free(res[i][j]);
        }
        free(res[i]);
    }
    free(res);

    return 0;
}
