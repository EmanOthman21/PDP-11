from DefineHandler import DefineHandling
from OperationHandler import OperationHandling, IsBranch


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


#For PC addressing modes
def EncodeVarOperand(operand_name):
  added_next_line = ""
  # Immedate
  if operand_name[0] =='#':
    added_next_line = int(operand_name[1:])
  # Absolute
  elif operand_name[0] =='@' and operand_name[1] == '#':
    added_next_line = int(operand_name[2:])
  # Relative Indirect
  elif operand_name[0] =='@':
    added_next_line = variables[operand_name[1:]]
  # Relative
  else:
    added_next_line = variables[operand_name]

  #Convert to binary string with length =16
  added_next_line = str(bin(added_next_line))
  added_next_line = added_next_line[2:]
  added_next_line = '0'*(16-len(added_next_line)) + added_next_line
  return added_next_line

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
  "LSL":"1101011100",
  "ROL":"1101100000"
}

# Branch instructions dictionary
branch_instructions = {
  "BR":"11000000",
  "BEQ":"11000010",
  "BNE":"11000100",
  "BL0":"11000110",
  "BLS":"11001000",
  "BHI":"11001010",
  "BHS":"11001100"
}

# No operands dictionary
no_operands_instructions = {
  "HLT": "1110000000000000"
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

  #ignoring NOP instruction
  if words[0] =="NOP":
    starting_address.append(starting_address[line_count-1])
    continue

  #Handle operations other than define
  if words[0] != 'Define':
    operation_instance , num_words = OperationHandling(words[0],words[1:])
    if num_words == 0:
      labels[operation_instance]=starting_address[line_count-1]
    else:
      operations.append(operation_instance)
    starting_address.append(num_words+starting_address[line_count-1])

  #Handle define keyword
  if words[0] == 'Define':
    define_instance = DefineHandling(words[1],words[2:],starting_address[line_count-1])
    define_arr.append(define_instance)
    variables[define_instance.name] = define_instance.address
    starting_address.append(define_instance.size+starting_address[line_count-1])

# Write the output file:
output_file = open('output.txt','w')
for operation in operations:
  #List of extra words to be printed
  out_line = []
  #Index to the x in the index addressing modes to know what x in the list to be accessed
  x_index=0

  #Handling two operand instructions
  if len(operation.operands) == 2:
    #Out the operation opcode
    output_file.write(two_operands_instructions[operation.name])
    #Handling operation operands
    for i in range(2):
      output_file.write(operation.modes[i])
      #Handling operands
      #Case1: operand is a register
      if operation.operands[i] in registers:
        output_file.write(registers[operation.operands[i]])
        #Extract (x)s of index addressing modes and add them to the list to be printed
        if operation.modes[i]=="011" or operation.modes[i] =="111":
          out_line.append(operation.x[x_index])
          x_index+=1
      #Case2: operand is not a register (PC addressing modes)
      else:
        output_file.write("111")
        out_line.append(EncodeVarOperand(operation.operands[i]))

    output_file.write("\n")
    for x_value in out_line:
      output_file.write(x_value)
      output_file.write("\n")

  #Handling one branch instructions
  elif len(operation.operands) == 1 and IsBranch(operation.name):
    #out instruction opcode
    output_file.write(branch_instructions[operation.name])
    #out the offset => binary string with length =8
    binary_value = str(bin(labels[operation.operands[0]]))
    binary_value = binary_value[2:]
    binary_value = '0'*(8-len(binary_value)) + binary_value
    output_file.write(binary_value)
    output_file.write("\n")

  #Handling one operand instruction
  elif len(operation.operands) == 1:
    #out the operation opcode
    output_file.write(one_operand_instructions[operation.name])
    #out the addressing mode
    output_file.write(operation.modes[0])
    if operation.operands[0] in registers:
      output_file.write(registers[operation.operands[0]])
      if operation.modes[0] == "011" or operation.modes[0] == "111":
        out_line.append(operation.x[x_index])
    else:
      output_file.write("111")
      out_line.append(EncodeVarOperand(operation.operands[0]))

    output_file.write("\n")
    for x_value in out_line:
      output_file.write(x_value)
      output_file.write("\n")

  elif len(operation.operands) == 0:
    output_file.write(no_operands_instructions[operation.name])
    output_file.write("\n")

#Handling defines
for define in define_arr:
  for val in define.values:
    binary_value=str(bin(val))
    binary_value = binary_value[2:]
    binary_value = '0'*(16-len(binary_value)) + binary_value
    output_file.write(binary_value)
    output_file.write("\n")
