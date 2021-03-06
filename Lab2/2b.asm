DATA SEGMENT
  ARRAY1 DW 11H,22H,33H,44H,55H,66H,77H,88H,99H,AAH;
  ARRAY2 DW 5 DUP (0);
  COUNT DB 05H 
DATA ENDS

CODE SEGMENT
  ASSUME CS:CODE,DS:DATA
  
START:
  MOV AX,DATA
  MOV DS,AX
  
  LEA SI,ARRAY1; Load SI with EA of ARRAY1 in ds
  LEA DI,ARRAY2; Load DI with EA of ARRAY2 in ds

  MOV CH, 00H
  MOV CL,COUNT

NEXT:
  MOV AX,[SI]
  MOV [DI],AX
  INC SI
  INC SI
  INC DI
  INC DI
  LOOP NEXT
  
  MOV AH,4CH
  INT 21H

CODE ENDS
END START