# ************** GoFit application ***********************
# ************** Developed by: Manisha Gupta **************
# Application ask user for his Age and fitness goal and prepares a 7 day work out plan to suit his goal.


# Function prints Gain weight workout upon call, accepts age as argument.
def GainWorkout(GetAge):
    # Dictionary that holds data for workout plan.
    GainWorkout_plan = {
                50 : {"Weekly structure":["5 Training Days", "2 Recovery Days"],"Cardio Type":["Light walking"],"Key Exercises":["Bench Press","Squats","Deadlifts","Pull-ups","Barbell Curls"],"Duration":"45–70 minutes","Calorie Recommendation":"300–400 calories above maintenance","Protein Guidelines":"0.7–1g per lb bodyweight","Expected Weekly Weight Gain":"0.25–0.375 lbs"}, 
                70  : {"Weekly structure":["4 Strength Days", "2 Light Activity Days", "1 Full Rest Day"],"Cardio Type":["30 min Brisk walking", "light cardio 15 -20 mins"],"Key Exercises":["Dumbbell Chest Press","Goblet Squats","Lat Pulldown","Romanian Deadlifts","Plank"],"Duration":"45–60 minutes","Calorie Recommendation":"250–350 calories above maintenance","Protein Guidelines":"0.8–1g per lb bodyweight","Expected Weekly Weight Gain":"0.125–0.25 lbs"}, 
                100 : {"Weekly structure":["3 Strength Days", "2 Light Movement Days", "2 Full Rest Days"],"Cardio Type":["20–30 minute brisk walk or cycling"],"Key Exercises":["Chair Squats","Wall Push-ups","Seated Dumbbell Shoulder Press","Resistance Band Rows"],"Duration":"30–45 minutes","Calorie Recommendation":"Small surplus (Eat slightly more than usual)","Protein Guidelines":"Protein at every meal (eggs, fish, chicken, lentils, Greek yogurt)","Expected Weekly Weight Gain":"Less than 0.125 lbs "}} 
    TempAge=1
    if (GetAge>17 and GetAge<51):
        TempAge = 50
    elif (GetAge>50 and GetAge<71):
        TempAge = 70
    elif (GetAge>70 and GetAge<100):
        TempAge = 100
    print( "\n Please find below your 7 day workout plan to gain weight. All the best! \n" )    
    print( "\n","Weekly Structure: ",GainWorkout_plan[TempAge]["Weekly structure"],"\n\n","Cardio Type: " ,GainWorkout_plan[TempAge]["Cardio Type"],"\n\n","Key Exercises: ", GainWorkout_plan[TempAge]["Key Exercises"],"\n\n","Duration: ", GainWorkout_plan[TempAge]["Duration"],"\n\n","Calorie Recommendation: ", GainWorkout_plan[TempAge]["Calorie Recommendation"],"\n\n","Protein Guidelines: ", GainWorkout_plan[TempAge]["Protein Guidelines"],"\n\n","Expected Weekly Weight Gain: ", GainWorkout_plan[TempAge]["Expected Weekly Weight Gain"],"\n"  )     

# Function prints Loose weight workout upon call, accepts age as argument.

def LooseWorkout(GetAge):
    # Dictionary that holds data for workout plan.
    LooseWorkout_plan = {
                50 : {"Weekly structure":["4 Strength Days", "2 Cardio Days", "1 Active Recovery Day"],"Cardio Type":["Brisk walking", "jogging", "cycling", "elliptical", "HIIT(Jump squats, mountain climbers, burpees)"],"Key Exercises":["Squats","Push-ups","Dumbbell Rows","Lunges","Bench Press","Romanian Deadlifts"],"Duration":"45–60 minutes","Calorie Deficit Recommendation":"300–500 calories below maintenance","Protein Guidelines":"0.7–1g per lb bodyweight","Expected Weekly Weight Loss":"0.5–1 lbs"}, 
                70  : {"Weekly structure":["3 Strength Days", "2 Cardio Days", "1 Active Recovery Day","1 Full Rest Day"],"Cardio Type":["Brisk walking", "cycling", "elliptical", "swimming"],"Key Exercises":["Goblet Squats","Dumbbell Chest Press","Seated Rows","Leg Press","Bench Press","Romanian Deadlift"],"Duration":"40–60 minutes","Calorie Deficit Recommendation":"300–400 calories below maintenance","Protein Guidelines":"Protein at every meal","Expected Weekly Weight Loss":"0.5–1 lbs"}, 
                100 : {"Weekly structure":["3 Strength/Resistance Days", "2 Cardio Days (low impact)", "1  Mobility / Balance Day","1 Full Rest Day"],"Cardio Type":["Walking (flat terrain)", "stationary bike", "elliptical", "swimming"],"Key Exercises":["Chair Squats","Wall Push-ups","Resistance Band Rows","Step-ups","Bird Dog"],"Duration":"30–50 minutes","Calorie Deficit Recommendation":"250–300 calories below maintenance","Protein Guidelines":"25–30g per meal","Expected Weekly Weight Loss":"0.25–0.5 lbs"}} 
    TempAge=1

    if (GetAge>17 and GetAge<51):
        TempAge = 50
    elif (GetAge>50 and GetAge<71):
        TempAge = 70
    elif (GetAge>70 and GetAge<100):
        TempAge = 100 

    print( "\n Please find below your 7 day workout plan to loose weight. All the best! \n" )    
    print( "\n","Weekly Structure: ",LooseWorkout_plan[TempAge]["Weekly structure"],"\n\n","Cardio Type: " ,LooseWorkout_plan[TempAge]["Cardio Type"],"\n\n","Key Exercises: ", LooseWorkout_plan[TempAge]["Key Exercises"],"\n\n","Duration: ", LooseWorkout_plan[TempAge]["Duration"],"\n\n","Calorie Deficit Recommendation: ", LooseWorkout_plan[TempAge]["Calorie Deficit Recommendation"],"\n\n","Protein Guidelines: ", LooseWorkout_plan[TempAge]["Protein Guidelines"],"\n\n","Expected Weekly Weight Loss: ", LooseWorkout_plan[TempAge]["Expected Weekly Weight Loss"],"\n"  )         
  
   
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
        
         

    
        
