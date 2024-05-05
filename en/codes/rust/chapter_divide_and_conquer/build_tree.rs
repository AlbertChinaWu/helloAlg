/*
 * File: build_tree.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use std::collections::HashMap;
use std::{cell::RefCell, rc::Rc};
include!("../include/include.rs");
use tree_node::TreeNode;

/* Build binary tree: Divide and conquer */
fn dfs(
    preorder: &[i32],
    inorder_map: &HashMap<i32, i32>,
    i: i32,
    l: i32,
    r: i32,
) -> Option<Rc<RefCell<TreeNode>>> {
    // Terminate when subtree interval is empty
    if r - l < 0 {
        return None;
    }
    // Initialize root node
    let root = TreeNode::new(preorder[i as usize]);
    // Query m to divide left and right subtrees
    let m = inorder_map.get(&preorder[i as usize]).unwrap();
    // Subproblem: build left subtree
    root.borrow_mut().left = dfs(preorder, inorder_map, i + 1, l, m - 1);
    // Subproblem: build right subtree
    root.borrow_mut().right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r);
    // Return root node
    Some(root)
}

/* Build binary tree */
fn build_tree(preorder: &[i32], inorder: &[i32]) -> Option<Rc<RefCell<TreeNode>>> {
    // Initialize hash table, storing in-order elements to indices mapping
    let mut inorder_map: HashMap<i32, i32> = HashMap::new();
    for i in 0..inorder.len() {
        inorder_map.insert(inorder[i], i as i32);
    }
    let root = dfs(preorder, &inorder_map, 0, 0, inorder.len() as i32 - 1);
    root
}

/* Driver Code */
fn main() {
    let preorder = [3, 9, 2, 1, 7];
    let inorder = [9, 3, 1, 2, 7];
    println!("In-order traversal = {:?}", preorder);
    println!("Pre-order traversal = {:?}", inorder);

    let root = build_tree(&preorder, &inorder);
    println!("The built binary tree is:");
    print_util::print_tree(root.as_ref().unwrap());
}
