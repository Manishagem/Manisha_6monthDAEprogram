# learning while loop

print( "Welcome to while loop learning" )
while True:
    inData = input("press 1 to see a message")
    if inData.strip()!= "1":
        print( "Wrong input, please press 1" )
        continue
    else:
        print("Have a nice day!")
        break
        
# learning for loop

fruits = ["apple", "banana", "cherry"]
for x in fruits:
  print(x) 
