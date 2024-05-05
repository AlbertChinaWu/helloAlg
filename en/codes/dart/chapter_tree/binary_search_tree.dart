/**
 * File: binary_search_tree.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Binary search tree */
class BinarySearchTree {
  late TreeNode? _root;

  /* Constructor */
  BinarySearchTree() {
    // Initialize empty tree
    _root = null;
  }

  /* Get the root node of the binary tree */
  TreeNode? getRoot() {
    return _root;
  }

  /* Search node */
  TreeNode? search(int _num) {
    TreeNode? cur = _root;
    // Loop find, break after passing leaf nodes
    while (cur != null) {
      // Target node is in cur's right subtree
      if (cur.val < _num)
        cur = cur.right;
      // Target node is in cur's left subtree
      else if (cur.val > _num)
        cur = cur.left;
      // Found target node, break loop
      else
        break;
    }
    // Return target node
    return cur;
  }

  /* Insert node */
  void insert(int _num) {
    // If tree is empty, initialize root node
    if (_root == null) {
      _root = TreeNode(_num);
      return;
    }
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // Loop find, break after passing leaf nodes
    while (cur != null) {
      // Found duplicate node, thus return
      if (cur.val == _num) return;
      pre = cur;
      // Insertion position is in cur's right subtree
      if (cur.val < _num)
        cur = cur.right;
      // Insertion position is in cur's left subtree
      else
        cur = cur.left;
    }
    // Insert node
    TreeNode? node = TreeNode(_num);
    if (pre!.val < _num)
      pre.right = node;
    else
      pre.left = node;
  }

  /* Remove node */
  void remove(int _num) {
    // If tree is empty, return
    if (_root == null) return;
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // Loop find, break after passing leaf nodes
    while (cur != null) {
      // Found node to be removed, break loop
      if (cur.val == _num) break;
      pre = cur;
      // Node to be removed is in cur's right subtree
      if (cur.val < _num)
        cur = cur.right;
      // Node to be removed is in cur's left subtree
      else
        cur = cur.left;
    }
    // If there is no node to remove, return
    if (cur == null) return;
    // Number of child nodes = 0 or 1
    if (cur.left == null || cur.right == null) {
      // When the number of child nodes = 0/1, child = null/that child node
      TreeNode? child = cur.left ?? cur.right;
      // Remove node cur
      if (cur != _root) {
        if (pre!.left == cur)
          pre.left = child;
        else
          pre.right = child;
      } else {
        // If the removed node is the root, reassign the root
        _root = child;
      }
    } else {
      // Number of child nodes = 2
      // Get the next node in in-order traversal of cur
      TreeNode? tmp = cur.right;
      while (tmp!.left != null) {
        tmp = tmp.left;
      }
      // Recursively remove node tmp
      remove(tmp.val);
      // Replace cur with tmp
      cur.val = tmp.val;
    }
  }
}

/* Driver Code */
void main() {
  /* Initialize binary search tree */
  BinarySearchTree bst = BinarySearchTree();
  // Note that different insertion orders can result in various tree structures. This particular sequence creates a perfect binary tree
  List<int> nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
  for (int _num in nums) {
    bst.insert(_num);
  }
  print("\nInitialized binary tree is\n");
  printTree(bst.getRoot());

  /* Search node */
  TreeNode? node = bst.search(7);
  print("\nFound node object = $node, node value = ${node?.val}");

  /* Insert node */
  bst.insert(16);
  print("\nAfter inserting node 16, the binary tree is\n");
  printTree(bst.getRoot());

  /* Remove node */
  bst.remove(1);
  print("\nAfter removing node 1, the binary tree is\n");
  printTree(bst.getRoot());
  bst.remove(2);
  print("\nAfter removing node 2, the binary tree is\n");
  printTree(bst.getRoot());
  bst.remove(4);
  print("\nAfter removing node 4, the binary tree is\n");
  printTree(bst.getRoot());
}
