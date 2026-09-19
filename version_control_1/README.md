# version_control_1

Practice area for the **Version Control** module (Git and GitHub).

## Contents

| File | What it is |
|------|------------|
| `RollADie.py` | A copy of the Roll-a-Die script, kept here as the sample file for version-control practice. It is identical to `firstPythonProject/RollADie.py`. |

## How version control is used in this project

This whole repository is a Git repository. Its `origin` remote is on GitHub (`Manishagem/Manisha_6monthDAEprogram`) and work is committed on the `main` branch. The everyday workflow is:

```bash
git status                       # see what changed
git add .                        # stage the changes
git commit -m "Describe change"  # save a snapshot with a message
git push                         # upload to GitHub
```

The `unix_1` screenshot shows this loop in action, committing an update to `GoFit.py` with the message "Add code to GoFit.py" and pushing it.

The repository is also published as a portfolio website with GitHub Pages; its source is in the `docs` folder.

## Skills shown

Checking repository status, staging and committing changes, writing clear commit messages, pushing to a remote, and using GitHub to publish work.

## Related folders

- [`../unix_1`](../unix_1): terminal screenshot including the Git commands.
- [`../firstPythonProject`](../firstPythonProject): the original Roll-a-Die project.
- [`../docs`](../docs): the GitHub Pages portfolio site.
