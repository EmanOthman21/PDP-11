class DefineClass:
  def __init__ (self,name,address):
    '''
    Initilize the name , size & values
    '''
    self.name=name
    self.size=0
    self.values=[]
    self.address=address

  def AddElement(self,element):
    '''
    1- Add new item to the array
    2- Increment the size
    '''
    self.values.append(int(element))
    self.size+=1


def DefineHandling(name,string_arr,address):
  '''
  1- Take array of strings : name of the array and the values separeted by spaces
  Ex: Arr 7 8 9 10
  2- Create instanse of DefineClass and save the data on it
  3- Return the define instanse to be saved
  '''
  define = DefineClass(name,address)
  for element in string_arr:
    if element == ';':
      break
    define.AddElement(element)
  return define