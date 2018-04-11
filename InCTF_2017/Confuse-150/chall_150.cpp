#include <iostream>
#include <signal.h>
#include <stdlib.h>
#include "md5.h"
using namespace std;

int cnt = 0;

int check (char num)
{
	char post[] = {'M', 'N', 'G', 'H', 'C', 'W', 'Z', 'I', 'J', 'D', 'X', 'O', 'P', 'K', 'L', 'E', 'S', 'U', 'V', 'T', 'F', 'Y', 'A'};
	if (post[cnt] == num)
		cnt++;
}

int search(char arr[], char x, int n)
{
    for (int i = 0; i < n; i++)
      if (arr[i] == x)
         return i;
    return -1;
}
 
void printPostOrder(char in[], char pre[], int n)
{
   int root = search(in, pre[0], n);
   
   if (root != 0)
      printPostOrder(in, pre+1, root);
 
   if (root != n-1)
      printPostOrder(in+root+1, pre+root+1, n-root-1);
 
   check(pre[0]);
}

void printflag(char pre[])
{
	cout<< "Good Work!"<<endl;
        cout << endl << "The flag is:" << endl;
        cout << "inctf{"<<md5(pre)<<"}";
}

void handler(int signal)
{
	if (signal == SIGSEGV)
	{
		cout<<"Nope";
		exit(0);
	}
}

int main()
{
	signal(SIGSEGV, handler);
	char pre[23];
	char in[] = {'M', 'G', 'N', 'C', 'H', 'X', 'W', 'I', 'Z', 'D', 'J', 'A', 'O', 'K', 'P', 'E', 'L', 'Y', 'S', 'F', 'U', 'T', 'V'};
	cout << "Enter input:";
	for(int i = 0; i < 23; i++)
		cin >> pre[i];
	int n = sizeof(in)/sizeof(in[0]);
  	printPostOrder(in, pre, n);
	if (cnt == 23)
		printflag(pre);
	else
		cout<<"Nope";
   	return 0;
}
