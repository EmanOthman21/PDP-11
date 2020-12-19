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



def OperationHandling(name,string_arr):
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
  return instruction, words_count