#include <bits/stdc++.h>
using namespace std;
void printKLengthString(char set[], string sequence, int n, int k) {
   if (k == 0){
      cout<<sequence<<", ";
      return;
   }
   for (int i = 0; i < n; i++){
      string newSequence;
      newSequence=sequence+set[i];
      printKLengthString(set, newSequence, n, k - 1);
   }
}
int main() {
   char set[] = {0, 21, 37, 97};
   int n = 4;
   int k = 11;
   printKLengthString(set, "", n, k);
}
