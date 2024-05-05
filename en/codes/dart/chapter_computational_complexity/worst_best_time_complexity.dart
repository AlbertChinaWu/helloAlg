/**
 * File: worst_best_time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Generate an array with elements {1, 2, ..., n} in a randomly shuffled order */
List<int> randomNumbers(int n) {
  final nums = List.filled(n, 0);
  // Generate array nums = { 1, 2, 3, ..., n }
  for (var i = 0; i < n; i++) {
    nums[i] = i + 1;
  }
  // Randomly shuffle array elements
  nums.shuffle();

  return nums;
}

/* Find the index of number 1 in array nums */
int findOne(List<int> nums) {
  for (var i = 0; i < nums.length; i++) {
    // When element 1 is at the start of the array, achieve best time complexity O(1)
    // When element 1 is at the end of the array, achieve worst time complexity O(n)
    if (nums[i] == 1) return i;
  }

  return -1;
}

/* Driver Code */
void main() {
  for (var i = 0; i < 10; i++) {
    int n = 100;
    final nums = randomNumbers(n);
    int index = findOne(nums);
    print('\n数组 [ 1, 2, ..., n ] 被打乱后 = $nums');
    print('数字 1 的索引为 + $index');
  }
}
