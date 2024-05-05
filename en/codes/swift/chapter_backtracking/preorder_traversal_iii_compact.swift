/**
 * File: preorder_traversal_iii_compact.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

var path: [TreeNode] = []
var res: [[TreeNode]] = []

/* Pre-order traversal: Example three */
func preOrder(root: TreeNode?) {
    // Pruning
    guard let root = root, root.val != 3 else {
        return
    }
    // Attempt
    path.append(root)
    if root.val == 7 {
        // Record solution
        res.append(path)
    }
    preOrder(root: root.left)
    preOrder(root: root.right)
    // Retract
    path.removeLast()
}

@main
enum PreorderTraversalIIICompact {
    /* Driver Code */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\nInitialize binary tree")
        PrintUtil.printTree(root: root)

        // Pre-order traversal
        path = []
        res = []
        preOrder(root: root)

        print("\nOutput all root-to-node 7 paths, not including nodes with value 3")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
