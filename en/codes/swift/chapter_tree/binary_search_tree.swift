/**
 * File: binary_search_tree.swift
 * Created Time: 2023-01-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Binary search tree */
class BinarySearchTree {
    private var root: TreeNode?

    /* Constructor */
    init() {
        // Initialize empty tree
        root = nil
    }

    /* Get binary tree root node */
    func getRoot() -> TreeNode? {
        root
    }

    /* Search node */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // Loop find, break after passing leaf nodes
        while cur != nil {
            // Target node is in cur's right subtree
            if cur!.val < num {
                cur = cur?.right
            }
            // Target node is in cur's left subtree
            else if cur!.val > num {
                cur = cur?.left
            }
            // Found target node, break loop
            else {
                break
            }
        }
        // Return target node
        return cur
    }

    /* Insert node */
    func insert(num: Int) {
        // If tree is empty, initialize root node
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // Loop find, break after passing leaf nodes
        while cur != nil {
            // Found duplicate node, thus return
            if cur!.val == num {
                return
            }
            pre = cur
            // Insertion position is in cur's right subtree
            if cur!.val < num {
                cur = cur?.right
            }
            // Insertion position is in cur's left subtree
            else {
                cur = cur?.left
            }
        }
        // Insert node
        let node = TreeNode(x: num)
        if pre!.val < num {
            pre?.right = node
        } else {
            pre?.left = node
        }
    }

    /* Remove node */
    func remove(num: Int) {
        // If tree is empty, return
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // Loop find, break after passing leaf nodes
        while cur != nil {
            // Found node to be removed, break loop
            if cur!.val == num {
                break
            }
            pre = cur
            // Node to be removed is in cur's right subtree
            if cur!.val < num {
                cur = cur?.right
            }
            // Node to be removed is in cur's left subtree
            else {
                cur = cur?.left
            }
        }
        // If no node to be removed, return
        if cur == nil {
            return
        }
        // Number of child nodes = 0 or 1
        if cur?.left == nil || cur?.right == nil {
            // When the number of child nodes = 0/1, child = null/that child node
            let child = cur?.left ?? cur?.right
            // Remove node cur
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // If the removed node is the root, reassign the root
                root = child
            }
        }
        // Number of child nodes = 2
        else {
            // Get the next node in in-order traversal of cur
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // Recursively remove node tmp
            remove(num: tmp!.val)
            // Replace cur with tmp
            cur?.val = tmp!.val
        }
    }
}

@main
enum _BinarySearchTree {
    /* Driver Code */
    static func main() {
        /* Initialize binary search tree */
        let bst = BinarySearchTree()
        // Note that different insertion orders can result in various tree structures. This particular sequence creates a perfect binary tree
        let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
        for num in nums {
            bst.insert(num: num)
        }
        print("\nInitialized binary tree is\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* Search node */
        let node = bst.search(num: 7)
        print("\nFound node object = \(node!), node value = \(node!.val)")

        /* Insert node */
        bst.insert(num: 16)
        print("\nAfter inserting node 16, the binary tree is\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* Remove node */
        bst.remove(num: 1)
        print("\nAfter removing node 1, the binary tree is\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 2)
        print("\nAfter removing node 2, the binary tree is\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 4)
        print("\nAfter removing node 4, the binary tree is\n")
        PrintUtil.printTree(root: bst.getRoot())
    }
}
