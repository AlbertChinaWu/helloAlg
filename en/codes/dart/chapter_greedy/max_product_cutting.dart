/**
 * File: max_product_cutting.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Maximum product of cutting: Greedy */
int maxProductCutting(int n) {
  // When n <= 3, must cut out a 1
  if (n <= 3) {
    return 1 * (n - 1);
  }
  // Greedy cut out 3s, a is the number of 3s, b is the remainder
  int a = n ~/ 3;
  int b = n % 3;
  if (b == 1) {
    // When the remainder is 1, convert a pair of 1 * 3 into 2 * 2
    return (pow(3, a - 1) * 2 * 2).toInt();
  }
  if (b == 2) {
    // When the remainder is 2, do nothing
    return (pow(3, a) * 2).toInt();
  }
  // When the remainder is 0, do nothing
  return pow(3, a).toInt();
}

/* Driver Code */
void main() {
  int n = 58;

  // Greedy algorithm
  int res = maxProductCutting(n);
  print("Maximum product of cutting = $res");
}
