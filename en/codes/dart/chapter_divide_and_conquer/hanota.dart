/**
 * File: hanota.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Move a disc */
void move(List<int> src, List<int> tar) {
  // Take out a disc from the top of src
  int pan = src.removeLast();
  // Place the disc on top of tar
  tar.add(pan);
}

/* Solve the Tower of Hanoi problem f(i) */
void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
  // If only one disc remains on src, move it to tar
  if (i == 1) {
    move(src, tar);
    return;
  }
  // Subproblem f(i-1): move the top i-1 discs from src with the help of tar to buf
  dfs(i - 1, src, tar, buf);
  // Subproblem f(1): move the remaining one disc from src to tar
  move(src, tar);
  // Subproblem f(i-1): move the top i-1 discs from buf with the help of src to tar
  dfs(i - 1, buf, src, tar);
}

/* Solve the Tower of Hanoi problem */
void solveHanota(List<int> A, List<int> B, List<int> C) {
  int n = A.length;
  // Move the top n discs from A with the help of B to C
  dfs(n, A, B, C);
}

/* Driver Code */
void main() {
  // The tail of the list is the top of the pillar
  List<int> A = [5, 4, 3, 2, 1];
  List<int> B = [];
  List<int> C = [];
  print("Initial state:");
  print("A = $A");
  print("B = $B");
  print("C = $C");

  solveHanota(A, B, C);

  print("After the discs are moved:");
  print("A = $A");
  print("B = $B");
  print("C = $C");
}
