﻿/**
* File: fractional_knapsack.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

/* Item */
class Item(int w, int v) {
    public int w = w; // Item weight
    public int v = v; // Item value
}

public class fractional_knapsack {
    /* Fractional knapsack: Greedy */
    double FractionalKnapsack(int[] wgt, int[] val, int cap) {
        // Create an item list, containing two properties: weight, value
        Item[] items = new Item[wgt.Length];
        for (int i = 0; i < wgt.Length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // Sort by unit value item.v / item.w from high to low
        Array.Sort(items, (x, y) => (y.v / y.w).CompareTo(x.v / x.w));
        // Loop for greedy selection
        double res = 0;
        foreach (Item item in items) {
            if (item.w <= cap) {
                // If the remaining capacity is sufficient, put the entire item into the knapsack
                res += item.v;
                cap -= item.w;
            } else {
                // If the remaining capacity is insufficient, put part of the item into the knapsack
                res += (double)item.v / item.w * cap;
                // No remaining capacity left, thus break the loop
                break;
            }
        }
        return res;
    }

    [Test]
    public void Test() {
        int[] wgt = [10, 20, 30, 40, 50];
        int[] val = [50, 120, 150, 210, 240];
        int cap = 50;

        // Greedy algorithm
        double res = FractionalKnapsack(wgt, val, cap);
        Console.WriteLine("The maximum value within the bag capacity is" + res);
    }
}