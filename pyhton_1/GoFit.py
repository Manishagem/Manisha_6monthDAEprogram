# ************** GoFit application ***********************
# ************** Developed by: Manisha Gupta **************
# Application ask user for his Age and fitness goal and prepares a 7 day work out plan to suit his goal.


# Function prints Gain weight workout upon call, accepts age as argument.
def GainWorkout(GetAge):
    if (GetAge>17 and GetAge<51):
        print( "\nGet workout plan1\n" )
    elif (GetAge>50 and GetAge<71):
        print( "\nGet workout plan2\n" )
    elif (GetAge>70 and GetAge<100):
        print( "Get workout plan3" )  

# Function prints Loose weight workout upon call, accepts age as argument.

def LooseWorkout(GetAge):
    if (GetAge>17 and GetAge<51):
        print( "Get workout plan1" )
    elif (GetAge>50 and GetAge<71):
        print( "Get workout plan2" )
    elif (GetAge>70 and GetAge<100):
        print( "Get workout plan3" )  
   
# Program execution starts here, Prints a welcome message.
print( "\n Welcome to GoFit App! \n GoFit generates a 7 day workout plan for you, either to gain or loose weight." )
# Loop1 to check if user wants another GoFit plan.
LoopCondition = True
while LoopCondition:
    inName = input( "\n Please enter your Name: " )
    # Loop2 to validate numbers for age user input.
    while True:
        try:
       
            inAge = int(input( "\n Please enter you Age: " ))
        except:
            print( "\n Incorrect input please enter number" ) 
            continue 
        break 
    # Loop2 ends

    #checks if User Age is less than 18, restricts using GoFit.
    if inAge < 19:
        print( " \n Sorry! you are under age to use this application." )
    # All users above 18 can get a GoFit plan.    
    else:
        print( " \n Please select one of the following fitness option." )
        inFitOpt = input( "\n Press 1 to choose Gain weight or Press 2 to Loose weight: " )
    # Loop3 to get correct input from user for his fitness goal.    
        while inFitOpt.strip() != "1" and inFitOpt.strip() != "2":
            print( "\n Incorrect input, please choose one option." )
            inFitOpt = int(input( "\n Press 1 to choose Gain weight or Press 2 to loose weight: " ))
            continue
    # Loop3 ends
     
    # Call GainWorkout if User chooses 1, or call LooseWorkout if user chooses 2.   
        if inFitOpt.strip() == "1":
            GainWorkout(inAge)
        else:
            LooseWorkout(inAge)  
    # Ask user if he wants to create another GoFit plan.        
    InRepeat = input( "\n Do you want to get workout plan for your friend. Press y to continue: " ) 
    if InRepeat != "y":
        LoopCondition = False
    # Loop1 ends    
        
         

    
        
