class Operation:
  def __init__ (self,name):
    '''
    Initilize the name , operands , modes
    '''
    self.name=name
    self.operands=[]
    self.modes=[]
    self.x = []

  def AddOperand(self,op):
    '''
      Add an operand to the operation
    '''
    self.operands.append(op)

  def AddAddressingMode(self,mode):
    '''
      Add an addressing mode to the operation
    '''
    self.modes.append(mode)

  def AddX(self,x):
    '''
    Save the index for the index addressing mode
    '''
    self.x.append(x)


def PCAddressingModes(operand_name):
  '''
  Take the operand and return it's addressing mode's binary code
  For PC addressing mode
  '''
  #Absolute (autoincrement indirect)
  if '#' in operand_name and '@' in operand_name:
    return "101"
  #Immediate (autoincrement)
  elif '#' in operand_name:
    return "001"
  #Relative indirect (index indirect)
  elif '@' in operand_name:
    return "111"
  #Index
  else:
    return "011"


def RegAddressingModes(operand_name):
  '''
  Take the operand and return it's addressing mode's binary code
  For Register addressing mode
  '''
  # Autoincrement indirect @(R)+
  if '@' in operand_name and '+' in operand_name:
    return "101"

  #Autoincrement direct (R)+
  elif '+' in operand_name:
    return "001"

  #Autodecrement indirect @-(R)
  elif '@' in operand_name and '-' in operand_name:
    return "110"

  #Autodecrement direct  -(R)
  elif '-' in operand_name:
    return "010"

  #Index indirect @x(R)
  elif '@' in operand_name and '+' not in operand_name and '-' not in operand_name and '(' in operand_name:
    return "111"

  #Index direct  x(R)
  elif '+' not in operand_name and '-' not in operand_name and '(' in operand_name:
    return "011"

  #Register indirect @R
  elif '@' in operand_name:
    return '100'

  #Register direct R
  else:
    return "000"

def IsBranch(name):
  '''
  Input: instruction name
  Output: Flag indicating if the instruction is branch instruction
  '''
  branches = ["BR","BEQ","BNE","BLO","BLS","BHI","BHS"]
  flag = False
  for branch in branches:
    if branch in name:
      flag = True
      break
  return flag

def IsRegister(name):
  '''
  Input: operand name
  Output: Flag indicating if the operand is register
  '''
  registers = ["R0","R1","R2","R3","R4","R5","R6","R7"]
  flag = False
  for register in registers:
    if register in name:
      flag = True
      break
  return flag

def OperationHandling(name,string_arr):
  '''
  1- Take the operation name and the operands array
  2- Check if it is a label return it and 0
  3- for each operand if it not one of the register increment the count
  4- Specify addressing modes
  5- Extract the operands
  6- For Index addressing modes increment the words count

  It returns class instance of operation contains name , operands , addressing modes returns also the number of words
  '''
  #Handling label lines
  if ':' in name:
    return (name[:len(name)-1] , 0)

  #Create operation instance
  instruction = Operation(name)
  #Initilize the count by 1
  words_count = 1

  for item in string_arr:
    if item[0] == ';' :
      break
    operands =item.split(',')

    for operand in operands:
      if operand != '':
        reg_flag = IsRegister(operand)
        #Handling PC addressing modes
        if not reg_flag and not IsBranch(name):
          instruction.AddOperand(operand)
          instruction.AddAddressingMode(PCAddressingModes(operand))
          words_count+=1
        #Handling register addressing modes
        elif reg_flag:
          R_index = operand.find('R')
          instruction.AddOperand(operand[R_index:R_index+2])
          addressing_mode=RegAddressingModes(operand)
          instruction.AddAddressingMode(addressing_mode)

          #Save x in index addressing modes case
          #Index addressing mode
          if addressing_mode == "011":
            upper_index = operand.find('(')
            #Extract X
            instruction.AddX(int(operand[:upper_index]))
            words_count+=1
          #Index direct addressing mode
          if addressing_mode == "111":
            words_count+=1
            upper_index = operand.find('(')
            instruction.AddX(int(operand[1:upper_index]))
        #Handling branch operation it have 1 operands and 0 addressing modes
        elif IsBranch(name):
          instruction.AddOperand(operand)

  return instruction, words_count