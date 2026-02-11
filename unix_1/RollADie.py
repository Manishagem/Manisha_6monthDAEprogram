# This piece of code is a Roll-A-Dice game.
import random
print( "Welcome to Roll-A-Die game!" )

# loop1 is to allow user to continue playing.
while True:
  # Ask user for input to roll a die
  inRollDieResponse = input( "Please press 1 to roll a die: " )

  # loop2 until user presses 1, correct response to roll die.
  while inRollDieResponse.strip() != "1":
    print( inRollDieResponse, " is incorrect response, please press 1 to roll a die" )
    inRollDieResponse = input( "Please press 1 to roll a die: " ) 
  # loop2 ends.    
  
  # If user presses 1 roll die and print the number.
  if inRollDieResponse.strip() == "1":
    print( "You rolled",random.randint(1,6) )
    
  #Ask user if he wants to continue to play the game.  
  inContinue = input( "Do you want to continue playing y/n: " )
  if not( inContinue == "y" ):
   break
# loop1 ends.  


