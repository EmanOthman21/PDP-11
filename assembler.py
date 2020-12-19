from DefineHandler import *

#Read the program line by line
program_file = open('example.txt','r')
lines = program_file.readlines()

# Array of defines data
define_arr=[]

#loop over the lines
for line in lines:

  #igonring the comment lines
  if line[0] == ';':
    continue

  #Split the line into words
  words = line.split()

  #Handle define keyword
  if words[0] == 'Define':
    define_instance = DefineHandling(words[1],words[2:])
    define_arr.append(define_instance)
