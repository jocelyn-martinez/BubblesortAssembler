;  Week 14 day 1 Exercise: Bubble Sort!
;
;  Jocelyn Martinez
;  April 2023


.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
array   DWORD        10, 30, 20, 100, 90, 30, 9, 40, 35, 0
numberofElements     DWORD ?
numberofElements1    DWORD ?
numberofElementsToGo DWORD ?
numberJ              DWORD ?
eax1                 DWORD ?
foundEnd             DWORD ?
temp    DWORD   ?
string  BYTE    100 DUP (?)
numstr  BYTE    11 DUP (?), 0
prompt1 BYTE    "Unsorted List", 0
prompt2 BYTE    "Sorted List", 0
inlimit DWORD   ?

.CODE
_MainProc PROC

;***  Print the original, unsorted list

        ; ECX holds the address of the string being built
        lea	   ecx, string

        ; EBX will hold the address of the current item in the array
        lea    ebx, array

        ; Look for the 0 at the end of the list
out1:   mov    eax, [ebx]
        cmp    al, 0
        je     outputstring

        ; Convert the number to a series of characters
        dtoa   numstr, eax

        ; Copy the characters to the string being build
        lea    edx, numstr
while1: mov     eax, [edx]
        cmp     al, 0
        jne     movechar
        add     ebx,4
        jmp     out1
movechar:
        mov     [ecx], eax      ; Move the character
        inc     edx             ; Increment counters
        inc     ecx
        jmp     while1

        ; Now output the string.
outputstring:
        output  prompt1, string


;*** Now launch into the Bubble Sort ********************************************************************************

        mov     eax, 0          
      start_loop:                           ; Count the length of array
       lea      ebx, array
       mov      ecx, [ebx+eax*4]
       cmp      ecx, 0
       je       end_loop;                   ; If it's equal to 0, the last element is found.
         inc    eax
         jmp    start_loop
       end_loop:
       mov      numberofElements , eax
       
       mov      numberofElements1, eax
       mov      eax, 0

       dec      numberofElements1

    start_outerloop:
      cmp       eax, numberofElements1; 
      jge       end_outerloop               ; The outer loop of bubble sort
      mov       ebx, 0
      mov       eax1, eax
      inc       eax1
                                            ; int numberofElementsToGo  = numberofElements - eax1;
      push      eax                         ; Computer number of elements to go.
      mov       eax, numberofElements
      sub       eax, eax1
      mov       numberofElementsToGo, eax
      pop       eax
            
    start_innerloop:                        ; The inner loop of bubble sort
     cmp        ebx, numberofElementsToGo
     jge        end_innerloop               ; int cmp = ebx >= numberofElementsToGo; if (cmp) goto end_innerloop;
     mov        numberJ, ebx                ; int numberJ = ebx;
     inc        numberJ                     ; numberJ++
     lea        ecx, array                  ; int *ecx = array+ebx;  
     add        ecx, ebx
     add        ecx, ebx
     add        ecx, ebx
     add        ecx, ebx
     lea        edx, array                  ; int *edx = array+numberJ;
     add        edx, numberJ
     add        edx, numberJ
     add        edx, numberJ
     add        edx, numberJ
     
     push       eax                         ; int inner = *ecx <= *edx;
     push       ebx
     mov        eax, [ecx]
     mov        ebx, [edx]
     cmp        eax, ebx
     pop        ebx
     pop        eax
     
     jle        end_if                      ; if (inner) goto endif;
     mov        edi, [ecx]                  ; Swapping elements here, temp. int edi = *ecx; 
     mov        esi, [edx]                  ; 
     mov        [ecx], esi                  ; *ecx = *edx; 
     mov        [edx], edi                  ; *edx = edi;

    end_if:
     inc        ebx
     jmp        start_innerloop

    end_innerloop:
     inc        eax
     jmp        start_outerloop

     end_outerloop:

;***  Print the new sorted list

display2:
        ; ECX holds the address of the string being built
        lea	   ecx, string

        ; EBX will hold the address of the current item in the array
        lea    ebx, array

        ; Look for the 0 at the end of the list
out2:   mov    eax, [ebx]
        cmp    al, 0
        je     outputstring2

        ; Convert the number to a series of characters
        dtoa   numstr, eax

        ; Copy the characters to the string being build
        lea    edx, numstr
while2: mov     eax, [edx]
        cmp     al, 0
        jne     movechar2
        add     ebx,4
        jmp     out2
movechar2:
        mov     [ecx], eax      ; Move the character
        inc     edx             ; Increment counters
        inc     ecx
        jmp     while2

        ; Now output the string.
outputstring2:
        output  prompt1, string

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code
