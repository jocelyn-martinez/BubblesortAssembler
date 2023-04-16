#include <stdio.h>
#include <stdlib.h>

// gcc -o mm  -std=c99  Bubblesort.c ; ./mm

  void bubbleSort(int *array)
  { int numberofElements;
    { int eax = 0;
      start_loop:;                         // Count the length of array
      int foundEnd = array[eax] == 0;
      if (foundEnd) goto end_loop;
        eax++;
        goto start_loop;
        end_loop:;
        numberofElements = eax;
    }
    
    int eax  = 0;
    int numberofElements1   = numberofElements;
        numberofElements1--;
    start_outerloop:;
    int outer = eax >= numberofElements1;
    if (outer) goto end_outerloop;        // The outer loop of bubble sort
        int ebx  = 0;
        int eax1 = eax;
            eax1++;
        int numberofElementsToGo  = numberofElements - eax1;
        
        
        start_innerloop:;                  // The inner loop of bubble sort
        int cmp = ebx >= numberofElementsToGo;
        if (cmp) goto end_innerloop;
          int numberJ = ebx;
              numberJ++;
          int *ecx = array+ebx;
          int *edx = array+numberJ;
      
				  int inner = *ecx <= *edx; 
          if (inner) goto endif; 
					  int edi = *ecx;                // Swap elements
					  *ecx = *edx; 
					  *edx = edi;  
          endif:;
          ebx++;                           //inc a
          goto start_innerloop;
        end_innerloop:;
        eax++;                             //inc a
        goto start_outerloop;
      end_outerloop:;
	}

  void main() {
		int x [] = {4, 6, 10, 5, 7, 0};
		bubbleSort(x);
		for(int i = 0; i < 5; i++) {
			printf("%4d\n", x[i]);
		}
	}
