from DefineHandler import *
from OperationHandler import *


#Read the program line by line
program_file = open('example.txt','r')
lines = program_file.readlines()
program_file.close()

# Array of defines data
define_arr=[]

# Starting addressing array
# Initilize the first starting address with 0
starting_address=[0]

# Labels dictionary
labels = {}

# Variables dictionary (first value only)
variables = {}

# Operations array
operations = []

#the index of the current line used in calculating the address
line_count=0

# Registers dictionary
registers = {
  "R0": "000",
  "R1": "001",
  "R2": "010",
  "R3": "011",
  "R4": "100",
  "R5": "101",
  "R6": "110",
  "R7": "111"
  }

# Two operands insturctions dictionary
two_operands_instructions = {
  "MOV":"0000",
  "ADD":"0001",
  "ADC":"0010",
  "SUB":"0011",
  "SBC":"0100",
  "AND":"0101",
  "OR":"0110",
  "XOR":"0111",
  "CMP":"1000"
  }

# One operand insturctions dictionary
one_operand_instructions = {
  "INC":"1101000000",
  "DEC":"1101000100",
  "CLR":"1101001000",
  "INV":"1101001100",
  "LSR":"1101010000",
  "ROR":"1101010100",
  "ASR":"1101011000",
  "LSR":"1101011100",
  "ROL":"1101100000"
}

# Branch instructions dictionary
branch_instructions = {
  "BR":"110000000",
  "BEQ":"110000100",
  "BNE":"110001000",
  "BL0":"110001100",
  "BLS":"110010000",
  "BHI":"110010100",
  "BHS":"110011000"
}

#loop over the lines
for line in lines:
  # Increment the count
  line_count+=1

  #igonring the comment lines
  if line[0] == ';':
    starting_address.append(starting_address[line_count-1])
    continue

  #Split the line into words
  words = line.split()
  
  #Handle operations other than define
  if words[0] != 'Define':
    operation_instance , num_words = OperationHandling(words[0],words[1:])
    if num_words == 0:
      labels[operation_instance]=starting_address[line_count-1]
      #labels.append(operation_instance)
    else:
      operations.append(operation_instance)
    starting_address.append(num_words+starting_address[line_count-1])

  #Handle define keyword
  if words[0] == 'Define':
    define_instance = DefineHandling(words[1],words[2:],starting_address[line_count-1])
    define_arr.append(define_instance)
    variables[define_instance.name] = define_instance.values[0]
    starting_address.append(define_instance.size+starting_address[line_count-1])


# Write the output file:
output_file = open('output.txt','w')
for operation in operations:
  if len(operation.operands) == 2:
    output_file.write(two_operands_instructions[operation.name])
    added_next_line= ""
    for i in range(2):
      output_file.write(operation.modes[i])
      if operation.operands[i] in registers:
        output_file.write(registers[operation.operands[i]])
      else:
        output_file.write("111")
        if operation.operands[i][0] =='#':
          added_next_line = int(operation.operands[i][1:])
        elif operation.operands[i][0] =='@' and operation.operands[i][1] == '#':
          added_next_line = int(operation.operands[i][2:])
        elif operation.operands[i][0] =='@':
          added_next_line = variables[operation.operands[i][1:]]
        else:
          added_next_line = variables[operation.operands[i]]
    output_file.write("\n")
    if added_next_line != "":
      binary_value = str(bin(added_next_line))
      output_file.write(binary_value[2:])
      output_file.write("\n")