# logic_1

Algorithm flowcharts from the programming-logic module. Each PDF is a one-page flowchart that plans a program's steps and decisions before any code is written.

## Contents

| File | Program | What the flowchart shows |
|------|---------|--------------------------|
| `Roll-a-Die AlgoNFlowchart.pdf` | Roll-a-Die | Welcome message, prompt to press 1, an error branch that loops back if the input is wrong, a random number from 1 to 6, the result display, and a "continue? press Y" loop before ending. |
| `GoFitAlgorithmnFlowchart.pdf` | GoFit | Welcome message, ask for name and age, an age check (`Age > 19?`) that turns away under-age users, a choice of fitness goal with a validation loop for incorrect input, then the workout plan. |
| `NutriFit AlgorithmNflowchart.pdf` | NutriFit | Prepare the nutrition and exercise data file, welcome the user, collect name, email, age, gender, weight, height, and diet preference, choose a fitness goal, build a diet plan and a workout plan, show a seven-day plan, and email it to the user. |

## How these connect to the code

- **Roll-a-Die** is implemented in [`../firstPythonProject/RollADie.py`](../firstPythonProject/RollADie.py).
- **GoFit** is implemented in [`../pyhton_1/GoFit.py`](../pyhton_1/GoFit.py); the age rule and goal validation in the flowchart match the code.
- **NutriFit** exists as a design only. There is no implementation in this repository.

## Skills shown

Breaking a problem into ordered steps, decision points, input-validation loops, and repeat loops, and expressing them in standard flowchart form.
