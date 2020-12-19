class Operation:
  def __init__ (self,name):
    '''
    Initilize the name , operands , modes
    '''
    self.name=name
    self.operands=[]
    self.modes=[]

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


def PCAddressingModes(operand_name):
  '''
  Take the operand and return it's addressing mode's binary code
  For PC addressing mode
  '''
  #Absolute
  if '#' in operand_name and '@' in operand_name:
    return "101"
  #Immediate
  elif '#' in operand_name:
    return "001"
  #Relative indirect
  elif '@' in operand_name:
    return "111"
  else:
    return "011"


def RegAddressingModes(operand_name):
  '''
  Take the operand and return it's addressing mode's binary code
  For Register addressing mode
  '''
  # Autoincrement indirect
  if '@' in operand_name and '+' in operand_name:
    return "101"

  #Autoincrement direct
  elif '+' in operand_name:
    return "001"

  #Autodecrement indirect
  elif '@' in operand_name and '-' in operand_name:
    return "110"

  #Autodecrement direct
  elif '-' in operand_name:
    return "010"

  #Index indirect
  elif '@' in operand_name and '+' not in operand_name and '-' not in operand_name and '(' in operand_name:
    return "111"

  #Index direct
  elif '+' not in operand_name and '-' not in operand_name and '(' in operand_name:
    return "011"

  #Register indirect
  elif '@' in operand_name:
    return '100'

  #Register direct
  else:
    return "000"

def OperationHandling(name,string_arr):
  '''
  1- Take the operation name and the operands array
  2- Check if it is a label return it and 0
  3- for each operand if it not one of the register increment the count

  It returns class instance of operation contains name , operands , addressing modes returns also the number of words
  '''
  if ':' in name:
    return (name[:len(name)-1] , 0)
  instruction = Operation(name)
  words_count = 1
  registers = ["R0","R1","R2","R3","R4","R5","R6","R7"]
  for item in string_arr:
    if item == ';':
      break
    operands =item.split(',')

    for operand in operands:
      if operand != '':
        reg_flag = False
        for reg in registers:
          if reg in operand:
            instruction.AddOperand(reg)
            reg_flag = True
            break
        if not reg_flag:
          instruction.AddOperand(operand)
          words_count+=1
          instruction.AddAddressingMode(PCAddressingModes(operand))

        else:
          instruction.AddAddressingMode(RegAddressingModes(operand))

  return instruction, words_count