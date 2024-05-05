/*
 * File: hashing_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use list_node::ListNode;
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

/* Hash search (array) */
fn hashing_search_array<'a>(map: &'a HashMap<i32, usize>, target: i32) -> Option<&'a usize> {
    // Hash table's key: target element, value: index
    // If the hash table does not contain this key, return None
    map.get(&target)
}

/* Hash search (linked list) */
fn hashing_search_linked_list(
    map: &HashMap<i32, Rc<RefCell<ListNode<i32>>>>,
    target: i32,
) -> Option<&Rc<RefCell<ListNode<i32>>>> {
    // Hash table key: target node value, value: node object
    // If the hash table does not contain this key, return None
    map.get(&target)
}

/* Driver Code */
pub fn main() {
    let target = 3;

    /* Hash search (array) */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    // Initialize hash table
    let mut map = HashMap::new();
    for (i, num) in nums.iter().enumerate() {
        map.insert(*num, i); // key: element, value: index
    }
    let index = hashing_search_array(&map, target);
    println!("The index of target element 3 is {}", index.unwrap());

    /* Hash search (linked list) */
    let head = ListNode::arr_to_linked_list(&nums);
    // Initialize hash table
    // let mut map1 = HashMap::new();
    let map1 = ListNode::linked_list_to_hashmap(head);
    let node = hashing_search_linked_list(&map1, target);
    println!("The corresponding node object for target value 3 is {:?}", node);
}
