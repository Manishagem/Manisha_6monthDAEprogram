# firstPythonProject

My first Python program from the cohort: a **Roll-a-Die** command-line game.

## Contents

| File | What it is |
|------|------------|
| `RollADie.py` | The complete game, about 25 lines of Python. |

## How the game works

1. Prints a welcome message.
2. Asks the player to press `1` to roll. Any other input prints an error and asks again (an input-validation loop).
3. On `1`, rolls a die using `random.randint(1, 6)` and prints the number.
4. Asks whether to keep playing. Typing `y` starts another round; anything else ends the game.

## Run it

```bash
python3 RollADie.py
```

(On Windows, use `python RollADie.py`.)

## Concepts practiced

- Importing and using the `random` module
- `input()` and `print()`
- Nested `while` loops: an outer loop to replay, an inner loop to validate input
- `if` conditions and `.strip()` for cleaning user input
- Code comments to explain each loop

## Related folders

- [`../logic_1`](../logic_1): the flowchart `Roll-a-Die AlgoNFlowchart.pdf` planned this program before it was coded.
- [`../pyhton_1`](../pyhton_1): a copy of the game alongside the larger GoFit app and loop exercises.
- [`../version_control_1`](../version_control_1): an identical copy used for the Git exercises.
