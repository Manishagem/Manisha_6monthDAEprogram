
workout_plan = {
                30 : {"Weekly structure":["4 Strength Days", "2 Cardio Days", "1 Active Recovery Day"],"Cardio Type":["Brisk walking", "jogging", "cycling", "elliptical", "HIIT"]}, 
                50:{"Weekly structure":["3 Strength Days", "1 Cardio Days", "3 Active Recovery Day"],"Cardio Type":["Brisk walking", "jogging", "cycling", "elliptical", "HIIT"]}}

print(workout_plan[30])
print(workout_plan[30]["Weekly structure"],"Cardio Type",workout_plan[30]["Cardio Type"])