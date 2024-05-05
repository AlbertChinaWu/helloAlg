/**
 * File: max_product_cutting.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Maximum product of cutting: Greedy */
function maxProductCutting(n) {
    // When n <= 3, must cut out a 1
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // Greedy cut out 3s, a is the number of 3s, b is the remainder
    let a = Math.floor(n / 3);
    let b = n % 3;
    if (b === 1) {
        // When the remainder is 1, convert a pair of 1 * 3 into 2 * 2
        return Math.pow(3, a - 1) * 2 * 2;
    }
    if (b === 2) {
        // When the remainder is 2, do nothing
        return Math.pow(3, a) * 2;
    }
    // When the remainder is 0, do nothing
    return Math.pow(3, a);
}

/* Driver Code */
let n = 58;

// Greedy algorithm
let res = maxProductCutting(n);
console.log(`最大切分乘积为 ${res}`);
