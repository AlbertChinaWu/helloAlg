/**
 * File: recursion.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Recursion */
func recur(n: Int) -> Int {
    // Termination condition
    if n == 1 {
        return 1
    }
    // Recursive: recursive call
    let res = recur(n: n - 1)
    // Return: return result
    return n + res
}

/* Simulate recursion with iteration */
func forLoopRecur(n: Int) -> Int {
    // Use an explicit stack to simulate the system call stack
    var stack: [Int] = []
    var res = 0
    // Recursive: recursive call
    for i in (1 ... n).reversed() {
        // Simulate "recursive" by "pushing onto the stack"
        stack.append(i)
    }
    // Return: return result
    while !stack.isEmpty {
        // Simulate "return" by "popping from the stack"
        res += stack.removeLast()
    }
    // res = 1+2+3+...+n
    return res
}

/* Tail recursion */
func tailRecur(n: Int, res: Int) -> Int {
    // Termination condition
    if n == 0 {
        return res
    }
    // Tail recursive call
    return tailRecur(n: n - 1, res: res + n)
}

/* Fibonacci sequence: Recursion */
func fib(n: Int) -> Int {
    // Termination condition f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1
    }
    // Recursive call f(n) = f(n-1) + f(n-2)
    let res = fib(n: n - 1) + fib(n: n - 2)
    // Return result f(n)
    return res
}

@main
enum Recursion {
    /* Driver Code */
    static func main() {
        let n = 5
        var res = 0

        res = recursion.recur(n: n)
        print("\nResult of recursive sum function res = \(res)")

        res = recursion.forLoopRecur(n: n)
        print("\nSum result of iterative simulation of recursion res = \(res)")

        res = recursion.tailRecur(n: n, res: 0)
        print("\nSum result of tail recursion function res = \(res)")

        res = recursion.fib(n: n)
        print("\nThe \(n)th term of Fibonacci sequence is \(res)")
    }
}
