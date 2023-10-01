/**
 * File: binary_search_recur.c
 * Created Time: 2023-10-01
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* ���ֲ��ң����� f(i, j) */
int dfs(vector *nums, int target, int i, int j) {
    // ������Ϊ�գ�������Ŀ��Ԫ�أ��򷵻� -1
    if (i > j) {
        return -1;
    }
    // �����е����� m
    int m = (i + j) / 2;
    int *elem = nums->data[m];
    if (*elem < target) {
        // �ݹ������� f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if (*elem > target) {
        // �ݹ������� f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // �ҵ�Ŀ��Ԫ�أ�����������
        return m;
    }
}

/* ���ֲ��� */
int binarySearch(vector *nums, int target) {
    int n = nums->size;
    // ������� f(0, n-1)
    return dfs(nums, target, 0, n - 1);
}

/* Driver Code */
int main() {
    int target = 6;
    int nums[] = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    vector *iNums = newVector(); // int
    for (int i = 0; i < sizeof(nums) / sizeof(nums[0]); i++) {
        vectorPushback(iNums, &nums[i], sizeof(int));
    }

    // ���ֲ��ң�˫�����䣩
    int index = binarySearch(iNums, target);
    printf("Ŀ��Ԫ�� 6 ������ = %d\n", index);

    return 0;
}