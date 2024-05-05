/**
 * File: binary_search_insertion.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Binary search for insertion point (no duplicate elements) */
int binarySearchInsertionSimple(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // Initialize double closed interval [0, n-1]
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // Calculate midpoint index m
    if (nums[m] < target) {
      i = m + 1; // Target is in interval [m+1, j]
    } else if (nums[m] > target) {
      j = m - 1; // Target is in interval [i, m-1]
    } else {
      return m; // Found target, return insertion point m
    }
  }
  // Did not find target, return insertion point i
  return i;
}

/* Binary search for insertion point (with duplicate elements) */
int binarySearchInsertion(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // Initialize double closed interval [0, n-1]
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // Calculate midpoint index m
    if (nums[m] < target) {
      i = m + 1; // Target is in interval [m+1, j]
    } else if (nums[m] > target) {
      j = m - 1; // Target is in interval [i, m-1]
    } else {
      j = m - 1; // First element less than target is in interval [i, m-1]
    }
  }
  // Return insertion point i
  return i;
}

/* Driver Code */
void main() {
  // Array without duplicate elements
  List<int> nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
  print("\nArray nums = $nums");
  // Binary search for insertion point
  for (int target in [6, 9]) {
    int index = binarySearchInsertionSimple(nums, target);
    print("Index of the insertion point for element $target = $index");
  }

  // Array with duplicate elements
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\nArray nums = $nums");
  // Binary search for insertion point
  for (int target in [2, 6, 20]) {
    int index = binarySearchInsertion(nums, target);
    print("Index of the insertion point for element $target = $index");
  }
}
