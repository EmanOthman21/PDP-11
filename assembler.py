from DefineHandler import *
from OperationHandler import *


#Read the program line by line
program_file = open('example.txt','r')
lines = program_file.readlines()

# Array of defines data
define_arr=[]

# Starting addressing array
# Initilize the first starting address with 0
starting_address=[0]

# Labels array
labels=[]

# Operations array
operations = []

#the index of the current line used in calculating the address
line_count=0

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
      #print(line)
      labels.append(operation_instance)
      #starting_address.append(starting_address[line_count-1])
    else:
      operations.append(operation_instance)
    starting_address.append(num_words+starting_address[line_count-1])

  #Handle define keyword
  if words[0] == 'Define':
    define_instance = DefineHandling(words[1],words[2:],starting_address[line_count-1])
    define_arr.append(define_instance)
    starting_address.append(define_instance.size+starting_address[line_count-1])