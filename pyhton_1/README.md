# pyhton_1

Python practice programs from the first part of the cohort, built up from small loop exercises to a complete command-line app, **GoFit**. Developed by Manisha Gupta.

The folder name is spelled `pyhton_1` in the repository; it is kept as-is so existing links keep working.

## Contents

| File | Description |
|------|-------------|
| `GoFit.py` | The main app: a command-line fitness planner that builds a 7-day workout plan from the user's age and goal. |
| `RollADie.py` | Roll-a-Die game with input validation and a replay loop. |
| `loop.py` | Practice for `while` and `for` loops. |
| `testFile.py` | Scratch file where the workout-plan dictionaries were prototyped before being moved into `GoFit.py`. |

## GoFit.py

**What it does:** asks for a name and age, then a goal (`1` = gain weight, `2` = lose weight), and prints a plan. It then offers to make another plan for a friend.

**Rules built into it**

- Users must be 19 or older; younger users get a polite refusal.
- The plan depends on age band: **19-50**, **51-70**, and **71-99**.
- Age must be a number, and the goal must be `1` or `2`; otherwise it asks again.

**What each plan includes:** weekly structure (strength, cardio, and rest days), cardio types, key exercises, session duration, a calorie target (surplus for gain, deficit for loss), protein guidelines, and expected weekly weight change.

**Code structure:** two functions, `GainWorkout(age)` and `LooseWorkout(age)`, each holding a dictionary of plans keyed by age band, plus a main loop that handles input and repeat play.

**Run it**

```bash
python3 GoFit.py
```

(On Windows, use `python GoFit.py`.)

## Other programs

- **`RollADie.py`**: prints a welcome, asks the player to press `1`, rolls with `random.randint(1, 6)`, and asks whether to play again.
- **`loop.py`**: a `while` loop that keeps asking for `1` until it gets it, then a `for` loop that prints items from a list of fruits.
- **`testFile.py`**: the same gain/lose dictionaries as `GoFit.py`, with a couple of `print` lines to check that lookups by age band work.

## Concepts practiced

Variables and data types, `input()` and type conversion, `try`/`except` for bad input, `if`/`elif`/`else`, `while` and `for` loops, functions, nested dictionaries and lists, string formatting, and code comments.

## Related folders

- [`../logic_1`](../logic_1): the flowcharts that planned GoFit and Roll-a-Die.
- [`../firstPythonProject`](../firstPythonProject): the first version of Roll-a-Die.
- [`../prompt_engineering_1`](../prompt_engineering_1): an infographic on the same loop concepts as `loop.py`.
