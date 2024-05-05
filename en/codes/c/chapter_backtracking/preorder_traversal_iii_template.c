/**
 * File: preorder_traversal_iii_template.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// Assume path sum result length does not exceed 100
#define MAX_SIZE 100
#define MAX_RES_SIZE 100

TreeNode *path[MAX_SIZE];
TreeNode *res[MAX_RES_SIZE][MAX_SIZE];
int pathSize = 0, resSize = 0;

/* Determine if the current state is a solution */
bool isSolution(void) {
    return pathSize > 0 && path[pathSize - 1]->val == 7;
}

/* Record solution */
void recordSolution(void) {
    for (int i = 0; i < pathSize; i++) {
        res[resSize][i] = path[i];
    }
    resSize++;
}

/* Determine if the choice is legal under the current state */
bool isValid(TreeNode *choice) {
    return choice != NULL && choice->val != 3;
}

/* Update state */
void makeChoice(TreeNode *choice) {
    path[pathSize++] = choice;
}

/* Restore state */
void undoChoice(void) {
    pathSize--;
}

/* Backtracking algorithm: Example three */
void backtrack(TreeNode *choices[2]) {
    // Check if it's a solution
    if (isSolution()) {
        // Record solution
        recordSolution();
    }
    // Traverse all choices
    for (int i = 0; i < 2; i++) {
        TreeNode *choice = choices[i];
        // Pruning: check if the choice is legal
        if (isValid(choice)) {
            // Attempt: make a choice, update the state
            makeChoice(choice);
            // Proceed to the next round of selection
            TreeNode *nextChoices[2] = {choice->left, choice->right};
            backtrack(nextChoices);
            // Retract: undo the choice, restore to the previous state
            undoChoice();
        }
    }
}

/* Driver Code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\nInitialize binary tree\n");
    printTree(root);

    // Backtracking algorithm
    TreeNode *choices[2] = {root, NULL};
    backtrack(choices);

    printf("\nOutput all paths from root to node 7, excluding paths containing value 3\n");
    for (int i = 0; i < resSize; ++i) {
        int *vals = malloc(MAX_SIZE * sizeof(int));
        int size = 0;
        for (int j = 0; res[i][j] != NULL; ++j) {
            vals[size++] = res[i][j]->val;
        }
        printArray(vals, size);
        free(vals);
    }

    // Free memory
    freeMemoryTree(root);
    return 0;
}
