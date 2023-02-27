"""
File: leetcode_two_sum.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
"""

from typing import List, Tuple, Optional

def two_sum_brute_force(nums: List[int], target: int) -> Optional[Tuple[int, int]]:
    """ 方法一：暴力枚举 """
    # 两层循环，时间复杂度 O(n^2)
    for i in range(len(nums) - 1):
        for j in range(i + 1, len(nums)):
            if nums[i] + nums[j] == target:
                return i, j
    return None

def two_sum_hash_table(nums: List[int], target: int) -> Optional[Tuple[int, int]]:
    """ 方法二：辅助哈希表 """
    # 辅助哈希表，空间复杂度 O(n)
    dic = {}
    # 单层循环，时间复杂度 O(n)
    for i in range(len(nums)):
        if target - nums[i] in dic:
            return dic[target - nums[i]], i
        dic[nums[i]] = i
    return None

""" Driver Code """
if __name__ == '__main__':
    # ======= Test Case =======
    test_nums = [2, 7, 11, 15]
    test_target = 9

    # ====== Driver Code ======
    # 方法一
    res = two_sum_brute_force(test_nums, test_target)
    print("方法一 res =", res)
    # 方法二
    res = two_sum_hash_table(test_nums, test_target)
    print("方法二 res =", res)
