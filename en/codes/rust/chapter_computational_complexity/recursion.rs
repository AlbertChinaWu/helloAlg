/*
 * File: recursion.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* Recursion */
fn recur(n: i32) -> i32 {
    // Termination condition
    if n == 1 {
        return 1;
    }
    // Recursive: recursive call
    let res = recur(n - 1);
    // Return: return result
    n + res
}

/* Simulate recursion with iteration */
fn for_loop_recur(n: i32) -> i32 {
    // Use an explicit stack to simulate the system call stack
    let mut stack = Vec::new();
    let mut res = 0;
    // Recursive: recursive call
    for i in (1..=n).rev() {
        // Simulate "recursive" by "pushing onto the stack"
        stack.push(i);
    }
    // Return: return result
    while !stack.is_empty() {
        // Simulate "return" by "popping from the stack"
        res += stack.pop().unwrap();
    }
    // res = 1+2+3+...+n
    res
}

/* Tail recursion */
fn tail_recur(n: i32, res: i32) -> i32 {
    // Termination condition
    if n == 0 {
        return res;
    }
    // Tail recursive call
    tail_recur(n - 1, res + n)
}

/* Fibonacci sequence: Recursion */
fn fib(n: i32) -> i32 {
    // Termination condition f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1;
    }
    // Recursive call f(n) = f(n-1) + f(n-2)
    let res = fib(n - 1) + fib(n - 2);
    // Return result
    res
}

/* Driver Code */
fn main() {
    let n = 5;
    let mut res;

    res = recur(n);
    println!("\nRecursive function sum result res = {res}");

    res = for_loop_recur(n);
    println!("\nSimulate recursion with iteration sum result res = {res}");

    res = tail_recur(n, 0);
    println!("\nTail recursive function sum result res = {res}");

    res = fib(n);
    println!("\nThe \(n)th term of the Fibonacci sequence is {res}");
}
