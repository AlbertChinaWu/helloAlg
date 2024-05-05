// File: space_complexity.go
// Created Time: 2022-12-15
// Author: cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"fmt"
	"strconv"

	. "github.com/krahets/hello-algo/pkg"
)

/* Structure */
type node struct {
	val  int
	next *node
}

/* Create node structure  */
func newNode(val int) *node {
	return &node{val: val}
}

/* Function */
func function() int {
	// Perform some operations...
	return 0
}

/* Constant complexity */
func spaceConstant(n int) {
	// Constants, variables, objects occupy O(1) space
	const a = 0
	b := 0
	nums := make([]int, 10000)
	node := newNode(0)
	// Variables in a loop occupy O(1) space
	var c int
	for i := 0; i < n; i++ {
		c = 0
	}
	// Functions in a loop occupy O(1) space
	for i := 0; i < n; i++ {
		function()
	}
	b += 0
	c += 0
	nums[0] = 0
	node.val = 0
}

/* Linear complexity */
func spaceLinear(n int) {
	// Array of length n occupies O(n) space
	_ = make([]int, n)
	// A list of length n occupies O(n) space
	var nodes []*node
	for i := 0; i < n; i++ {
		nodes = append(nodes, newNode(i))
	}
	// A hash table of length n occupies O(n) space
	m := make(map[int]string, n)
	for i := 0; i < n; i++ {
		m[i] = strconv.Itoa(i)
	}
}

/* Linear complexity (recursive implementation) */
func spaceLinearRecur(n int) {
	fmt.Println("Recursive n =", n)
	if n == 1 {
		return
	}
	spaceLinearRecur(n - 1)
}

/* Quadratic complexity */
func spaceQuadratic(n int) {
	// Matrix occupies O(n^2) space
	numMatrix := make([][]int, n)
	for i := 0; i < n; i++ {
		numMatrix[i] = make([]int, n)
	}
}

/* Quadratic complexity (recursive implementation) */
func spaceQuadraticRecur(n int) int {
	if n <= 0 {
		return 0
	}
	nums := make([]int, n)
	fmt.Printf("Recursion n = %d with nums length = %d \n", n, len(nums))
	return spaceQuadraticRecur(n - 1)
}

/* Exponential complexity (building a full binary tree) */
func buildTree(n int) *TreeNode {
	if n == 0 {
		return nil
	}
	root := NewTreeNode(0)
	root.Left = buildTree(n - 1)
	root.Right = buildTree(n - 1)
	return root
}
