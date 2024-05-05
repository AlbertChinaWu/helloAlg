/**
 * File: preorder_traversal_iii_template.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Determine if the current state is a solution */
bool isSolution(List<TreeNode> state) {
  return state.isNotEmpty && state.last.val == 7;
}

/* Record solution */
void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
  res.add(List.from(state));
}

/* Determine if the choice is legal under the current state */
bool isValid(List<TreeNode> state, TreeNode? choice) {
  return choice != null && choice.val != 3;
}

/* Update state */
void makeChoice(List<TreeNode> state, TreeNode? choice) {
  state.add(choice!);
}

/* Restore state */
void undoChoice(List<TreeNode> state, TreeNode? choice) {
  state.removeLast();
}

/* Backtracking algorithm: Example three */
void backtrack(
  List<TreeNode> state,
  List<TreeNode?> choices,
  List<List<TreeNode>> res,
) {
  // Check if it's a solution
  if (isSolution(state)) {
    // Record solution
    recordSolution(state, res);
  }
  // Traverse all choices
  for (TreeNode? choice in choices) {
    // Pruning: check if the choice is legal
    if (isValid(state, choice)) {
      // Attempt: make a choice, update the state
      makeChoice(state, choice);
      // Proceed to the next round of selection
      backtrack(state, [choice!.left, choice.right], res);
      // Retract: undo the choice, restore to the previous state
      undoChoice(state, choice);
    }
  }
}

/* Driver Code */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\nInitialize binary tree");
  printTree(root);

  // Backtracking algorithm
  List<List<TreeNode>> res = [];
  backtrack([], [root!], res);
  print("\nOutput all root-to-node 7 paths, requiring paths not to include nodes with value 3");
  for (List<TreeNode> path in res) {
    print(List.from(path.map((e) => e.val)));
  }
}
