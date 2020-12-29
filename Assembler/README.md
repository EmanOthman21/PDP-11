# Python Assembler
A program to convert assembly instruction to binary.

# Run the program
```
python assembler.py <input_file_path> <output_file_path>
```

# Provided Syntax
  ## Arrays
  ```
  Define <arr_name> <val1> <val2> <val3>
  ```
  The values of the array sparated by space

  ## Addressing modes examples:
    - Register direct => INC R1
    - Register indirect => INC @R1
    - Autoincrement direct => INC (R1)+
    - Autoincrement indirect => INC @(R1)+
    - Autodecrement direct => INC -(R1)
    - Autodecrement indirect => INC @-(R1)
    - Index direct => INC 10(R1)
    - Index indirect => INC @10(R1)
    - Immediate => MOV #10, R1
    - Absolute => Mov @#10, R1
    - Relative => INC N
    - Relative indirect => INC @N