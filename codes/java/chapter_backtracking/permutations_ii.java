/**
 * File: permutations_ii.java
 * Created Time: 2023-04-24
 * Author: Krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_ii {
    /* 回溯算法：全排列 II */
    public static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // 当状态长度等于元素数量时，记录解
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // 遍历所有选择
        Set<Integer> duplicated = new HashSet<Integer>();
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
            if (!selected[i] && !duplicated.contains(choice)) {
                // 尝试
                duplicated.add(choice); // 记录选择过的元素值
                selected[i] = true; // 做出选择
                state.add(choice); // 更新状态
                backtrack(state, choices, selected, res);
                // 回退
                selected[i] = false; // 撤销选择
                state.remove(state.size() - 1); // 恢复到之前的状态
            }
        }
    }

    public static void main(String[] args) {
        int[] nums = { 1, 2, 2 };
        List<List<Integer>> res = new ArrayList<List<Integer>>();

        // 回溯算法
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);

        System.out.println("输入数组 nums = " + Arrays.toString(nums));
        System.out.println("所有排列 res = " + res);
    }
}
