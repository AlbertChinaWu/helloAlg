/**
 * File: binary_search_tree.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 二叉搜索树 */
TreeNode? root;

void binarySearchTree(List<int> nums) {
  nums.sort(); // 排序数组
  root = buildTree(nums, 0, nums.length - 1); // 构建二叉搜索树
}

/* 获取二叉树的根节点 */
TreeNode? getRoot() {
  return root;
}

/* 构建二叉上搜索树 */
TreeNode? buildTree(List<int> nums, int i, int j) {
  if (i > j) {
    return null;
  }
  // 将数组中间结点作为根结点
  int mid = (i + j) ~/ 2;
  TreeNode? root = TreeNode(nums[mid]);
  root.left = buildTree(nums, i, mid - 1);
  root.right = buildTree(nums, mid + 1, j);
  return root;
}

/* 查找结点 */
TreeNode? search(int num) {
  TreeNode? cur = root;
  // 循环查找，越过叶结点后跳出
  while (cur != null) {
    // 目标结点在 cur 的右子树中
    if (cur.val < num)
      cur = cur.right;
    // 目标结点在 cur 的左子树中
    else if (cur.val > num)
      cur = cur.left;
    // 找到目标结点，跳出循环
    else
      break;
  }
  // 返回目标结点
  return cur;
}

/* 插入结点 */
TreeNode? insert(int num) {
  // 若树为空，直接提前返回
  if (root == null) return null;
  TreeNode? cur = root;
  TreeNode? pre = null;
  // 循环查找，越过叶结点后跳出
  while (cur != null) {
    // 找到重复结点，直接返回
    if (cur.val == num) return null;
    pre = cur;
    // 插入位置在 cur 的右子树中
    if (cur.val < num)
      cur = cur.right;
    // 插入位置在 cur 的左子树中
    else
      cur = cur.left;
  }
  // 插入结点 val
  TreeNode? node = TreeNode(num);
  if (pre!.val < num)
    pre.right = node;
  else
    pre.left = node;
  return node;
}

/* 删除结点 */
TreeNode? remove(int num) {
  // 若树为空，直接提前返回
  if (root == null) return null;

  TreeNode? cur = root;
  TreeNode? pre = null;
  // 循环查找，越过叶结点后跳出
  while (cur != null) {
    // 找到待删除结点，跳出循环
    if (cur.val == num) break;
    pre = cur;
    // 待删除结点在 cur 的右子树中
    if (cur.val < num)
      cur = cur.right;
    // 待删除结点在 cur 的左子树中
    else
      cur = cur.left;
  }
  // 若无待删除结点，直接返回
  if (cur == null) return null;
  // 子结点数量 = 0 or 1
  if (cur.left == null || cur.right == null) {
    // 当子结点数量 = 0 / 1 时， child = null / 该子结点
    TreeNode? child = cur.left ?? cur.right;
    // 删除结点 cur
    if (pre!.left == cur)
      pre.left = child;
    else
      pre.right = child;
  } else {
    // 子结点数量 = 2
    // 获取中序遍历中 cur 的下一个结点
    TreeNode? nex = getInOrderNext(cur.right);
    int tem = nex!.val;
    // 递归删除结点 nex
    remove(nex.val);
    // 将 nex 的值复制给 cur
    cur.val = tem;
  }
  return cur;
}

/* 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况） */
TreeNode? getInOrderNext(TreeNode? root) {
  if (root == null) return null;
  // 循环访问左子结点，直到叶结点时为最小结点，跳出
  while (root!.left != null) {
    root = root.left;
  }
  return root;
}

/* Driver Code */
void main() {
  /* 初始化二叉搜索树 */
  List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  binarySearchTree(nums);
  print("\n初始化的二叉树为\n");
  printTree(getRoot());

  /* 查找结点 */
  TreeNode? node = search(7);
  print("\n查找到的结点对象为 $node，结点值 = ${node?.val}");

  /* 插入结点 */
  node = insert(16);
  print("\n插入节点 16 后，二叉树为\n");
  printTree(getRoot());

  /* 删除结点 */
  remove(1);
  print("\n删除结点 1 后，二叉树为\n");
  printTree(getRoot());
  remove(2);
  print("\n删除结点 2 后，二叉树为\n");
  printTree(getRoot());
  remove(4);
  print("\n删除结点 4 后，二叉树为\n");
  printTree(getRoot());
}
