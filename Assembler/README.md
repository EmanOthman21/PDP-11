## Python Assembler
A program to convert assembly instruction to binary.

## Run the program
```
python assembler.py <input_file_path> <output_file_path>
```

## Provided Syntax
  ### Arrays
  ```
  Define <arr_name> <val1> <val2> <val3>
  ```
  The values of the array sparated by space

  ### Addressing modes examples:
  - Register direct
  ```
  INC R1
  ```
  - Autoincrement direct
  ```
  INC (R1)+
  ```
  - Autodecrement direct
  ```
  INC -(R1)
  ```
  - Index direct
  ```
  INC 10(R1)
  ```
  - Immediate
  ```
  MOV #10, R1
  ```
  - Relative
  ```
  INC N
  ```
  For indirect addressing modes add '@' before the direct mode syntax
  
  ## Some assumptions

  ### To use a comment in the same line you should put a space between ';' and the operand
  ```
  MOV R1, R2 ;comment here
  ```
  
  ### The program should not include empty lines
  
  ### The Labels' name must be alone in a single line
  ```
  Label 1:
  MOV R1, R2
  ```
