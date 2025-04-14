# 2025-game: Snake with Godot

Welcome to the Godot Snake Game project for 2025! This guide will help you get started with setting up the project, understanding the basics of Godot, and collaborating using Git. This is a beginner-friendly guide aimed at teaching key game development concepts through the recreation of the classic Snake game.

This project will be challenging to complete in the short time we have, but it will be a great way to learn the basics of Godot and GDScript, along with some good code coding practices that I wish I had known when I was starting out.

This guide will be long and will hopefully will cover most of the key concepts you need to know to get started with Godot and Git. If you have any questions, feel free to ask and I will try to update this guide as problems arise.

## Table of Contents

- [Who am I](#who-am-i)
- [Game concept](#game-concept)
- [Godot concepts](#godot-concepts)
- [Project Setup](#project-setup)
- [Understanding Git](#understanding-git)
- [Getting Started with Godot](#getting-started-with-godot)
- [Snake Game Design](#snake-game-design)
- [Useful Tutorials and Resources](#useful-tutorials-and-resources)


## Who am I
* My name is Logan and I will be your advisor for this project.
* I am a software engineer and am currently working on my own hobby game project on the side using Godot.
* I will be doing my best to help you and answer any questions you may have with this project.
* I will also be reviewing your code and providing feedback through GitHub issues and discussions.


## Game concept

You will be building out a snake game using Godot and GDScript.
* The game will be a 2D game where the player controls a snake that moves around the screen.
* The snake will grow longer every time it eats food.
* The game will end when the snake runs into the screen edges or itself.

## Godot concepts

* Nodes
* Scenes
* Signals (Similar to the concept of `events` in other languages)
* Global singletons (Essentially global objects)
* Static functions (Functions that belong to the class itself rather than an instance of the class)
* GDScript
    * Good coding practices such as:
        * static typing
        * proper variable/function naming (Will follow standard python naming conventions)
        * file organization
        * code documentation
* Exporting your game.


## Project Setup

### 1. Install Godot

* Download the Godot 4.4.1 version from [godotengine.org](https://godotengine.org).

* Extract and run the executable (no installation required).

### 2. Install Git

* Download and install Git from [git-scm.com](https://git-scm.com/downloads).

### 3. Clone the Project Repo

* Open up git bash in a folder of your choice that will hold the project and run the following commands:
```bash
git clone https://github.com/clay-computer-science/2025-game.git
cd 2025-game
```

### 4. Open the Project in Godot

* Launch Godot.
* Click on "Import" and select the `project.godot` file inside the cloned repo.
* At the top of Godot go to Editor -> Editor Settings -> Text Editor -> Completion and turn on `Add Type Hints` (This will help with code completion utilizing static type hints).
* Go to Editor -> Editor Settings -> Text Editor -> Appearance and ensure that `Draw Tabs` is turned on, `Draw Spaces` is turned off, and `Line Spacing` is set to 4. (This will help with code readability and will make it consistent with common code editors such as VSCode).


## Understanding Git

* Git is a version control system that helps you track changes to your code.

### Windows
* [Git Bash](https://gitforwindows.org/) (Included with Windows Git installation, just search for `Git Bash` in the start menu) to run Git commands (My Recommendation and this guide only covers how to use Git terminal commands which you can use with Git Bash).
* You can also use [GitHub Desktop](https://desktop.github.com/) to run Git commands.

### macOS
* Terminal to run Git commands.
* You can also use [GitHub Desktop](https://desktop.github.com/) to run Git commands.

### Linux
* Terminal to run Git commands.

### Vocabulary

* `Remote`: Refers to a copy of your repository that is stored on a remote server.
* `Local`: Refers to a copy of your repository that is stored on your computer.
* `Branch`: A line of development in your code (Think of it like a separate version of your codebase).
    * **Example**: You can have a `main` branch and a `feature` branch. Usually the `main` branch is the default branch and should always be in a stable state. The `feature` branch could be branched off of `main` and is where you can experiment with developing new features which will be merged into the `main` branch when they are ready.
    * **Note**: Usually you will want to create a new branch from within GitHub through a GitHub Issue, then use `git fetch` and `git checkout branch_name` to pull down and swap to your new branch. This also ensures that you have a mapping of GitHub issues with your branches making pull requests easier to create and manage.
* `Commit`: A snapshot of your code at a specific point in time (Think of it like saving your progress in a video game but for your codebase).
    * **Note**: All commits are identified by a unique hash (a long string of characters) which you can use to reference them if you want to revert to a previous state.
* `Merge`: The process of combining changes from one branch into another.
    * **Example**: If you want to update your `feature` branch with the latest changes from the `main` branch, you would first switch to the `feature` branch with `git checkout feature_branch` and then run `git merge main`. (Ensure your local `main` branch is up to date by running `git pull` before merging)
* `Rebase`: The process of moving or combining a sequence of commits to a new base commit.
    * **Example**: If you want to update your `feature` branch with the latest changes from the `main` branch, you would first switch to the `feature` branch with `git checkout feature_branch` and then run `git rebase main`.
    * **Note**: This is similar to `merge` but instead of creating a new merge commit, it will replay the commits on top of the new base commit resulting in a linear history. This is often preferred in professional environments for a cleaner history.
* `Merge Conflict`: A situation where two branches have different changes in the same part of the code, making it impossible to automatically merge them.
    * **Example**: If you and a team member both modify the same part of a file, Git will prevent you from merging the branches and will require you to resolve the conflict manually.
    * **Note**: You will usually resolve merge conflicts by manually editing the file to resolve the conflict and then commit the changes.
    * To avoid conflicts, always pull the latest changes from the remote repository before starting work on a new feature and try your best to avoid having multiple people working on the same part of the code at the same time.
    * [Merge Conflict Video](https://www.youtube.com/watch?v=DloR0BOGNU0)
* `Pull Request`: A request to merge changes from one branch into another.
    * **Note**: You will usually create a pull request through GitHub and have a team member review your changes before they are merged into the main branch to ensure that the changes work as expected without breaking the current stable codebase.

### Common Commands
* `git fetch` - Fetch changes from the remote repository (Updates your local copy of the remote repository to know about all of the remote commits).
* `git status` - Check the status of your local clone of the repository on your current branch.
* `git checkout` - Switch to a different branch or commit locally.
* `git add` - Add changes to the staging area (prepare them for a commit).
* `git commit` - Commit changes to the repository on your current branch locally.
    * `git commit -m "message"` - Adds a message to your commit (Best practice to describe what changes were made).
* `git push` - Push local changes to the remote repository (All of your local commits).
* `git pull` - Pull changes from the remote repository (All of the remote commits).
* `git stash` - Sends all of your unstaged changes to a temporary storage area (Useful when you need to switch to a different branch but don't want to commit your changes yet).
* `git stash pop` - Retrieves the most recent stash and applies it to your working directory.
* `git reset` - Revert changes to the working directory. **(DO NOT USE THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING)**
    * `git reset --hard` - Revert changes to the working directory and remove all unstaged changes (Removes all uncommitted changes).
    * `git reset --soft` - Revert changes to the working directory but keep the changes in the staging area (Keeps all uncommitted changes).

**Note**: All of these commands can be followed with `--help` to get more information about the command and how to use it.

### Good Git Practices
* Keep your `main` branch stable and free of bugs.
* Create issues on GitHub to track tasks and bugs.
* Create feature branches from the GitHub issue you are working on.
* Use pull requests to merge your feature branches into the `main` branch and have at least one reviewer approve the changes.
* Keep your local copy of `main` up to date by running `git fetch` and `git pull` before starting work on a new feature or trying to merge current `main` into your feature branch.
* Always `merge` `main` into your feature branch or `rebase` your feature branch on top of `main` **BEFORE** creating a pull request (don't forget to push your changes after merging or rebasing).


## Getting Started with Godot

* [Getting Started with Godot Video](https://www.youtube.com/watch?v=6YNKi3hcS5U&list=PLu2_nk4Fitecf66b5E-WdarNafvAMBWjk)

### Declaring Variables

```python
var my_number: int = 10
var my_string: String = "Hello, World!"
var my_list: Array[int] = [1, 2, 3, 4, 5]
var my_dict: Dictionary[String, int] = {"one": 1, "two": 2, "three": 3}
```

### Syntax:

* `var`: Declares a variable.
* `my_number`: The name of the variable.
* `int`: The type of the variable (integer).
* `String`: The type of the variable (string).
* `Array[int]`: The type of the variable (array of integers).
* `Dictionary[String, int]`: The type of the variable (dictionary with string keys and integer values).

### Good Practices

* Always statically define what your variables are, GDScript allows you to not define variable types, but it is recommended to do so for better code quality, to avoid errors, and to improve runtime efficiency.
* Use descriptive names for your variables that describe their purpose.
* Use proper variable naming conventions (snake_case for variables, this is the python standard).

### Declaring Functions

```python
## Adds two numbers and returns the result.[br]
## [u][b]Args:[/u][br]
## [u][/u]        [param a]: [int] - The first number to add.[br]
## [u][/u]        [param b]: [int] - The second number to add.[br]
## [u][b]Returns:[/u][br]
## [u][/u]        [int] - The sum of the two numbers.
func add(a: int, b: int) -> int:
    return a + b

var result: int = add(1, 2)
print(result) # prints 3
```

### Syntax:

* `func`: Declares a function.
* `add`: The name of the function.
* `a: int`: The first parameter of the function (integer).
* `b: int`: The second parameter of the function (integer).
* `-> int`: The return type of the function (integer).
* `##`: Adds a documentation comment that Godot can render in its auto-documentation features.
* `[br]`: Adds a line break around a section of comment text.
* `[u]`: Adds an underline around a section of comment text.
* `[b]`: Adds bold text around a section of comment text.
* `[/u]`: Indicates where the end of the underlined text is.
* `[/b]`: Indicates where the end of bold text is.
* `param`: Indicates a parameter of the function.

**Note**: The function doc string in this example is my own format that I like the look of in Godot's rendering of the documentation. There is currently no standardized format for function doc strings in GDScript, but I recommend using this format for consistency and readability.

### Good Practices

* Use descriptive names for your functions that describe their purpose.
* Use proper function naming conventions (snake_case for functions, this is the python standard).
* Add documentation comments to your functions to describe what they do and how to use them.


### Classes
Example: `snake.gd`:
```python
extends Node2D
class_name Snake

## The Snake object description.

## The length of the snake.
var length: int = 1

## Called when the node is added to the scene.
func _ready() -> void:
    pass

## Called every frame.
func _process(delta: float) -> void:
    pass

## Handles movement logic.
func _handle_movement() -> void:
    pass
```

### Syntax

* `extends`: Specifies the base class for the class (In this case `Node2D`).
* `class_name`: Specifies the name of the class (In this case `Snake`).
* `func`: Declares a function.
* `-> void`: Specifies the return type of a function to be `void` (Equivalent to `None` in python).
* `pass`: A placeholder for code that will be added later.

### Good Practices

* Use descriptive names for your classes that describe their purpose.
* Use proper class naming conventions (PascalCase for classes, this is the python standard).
* Add documentation comments to your classes and functions to describe what they do and how to use them.

### Extra Notes

* [Class Tutorial Video](https://www.youtube.com/watch?v=uV6XIlLmMco)


## Snake Game Design

I will leave it up to you on how you want to design the snake game, but I will leave some suggestions here.

### Game Requirements:

* The snake should be a series of squares that move in a grid.
* The snake should be able to grow when it eats food.
* The snake should be able to move in 4 directions (up, down, left, right).
* The snake should be able to wrap around the screen.
* The snake should be able to detect collisions with itself.
* The snake should be able to detect collisions with the food.
* The food should be a random location on the screen.
* The food should be able to be eaten by the snake.
* The game should have a score.
* The game should have a game over screen.
* The game should have a main menu.

### Suggestions:

* Create a grid slot object (What node should it inherit from? Node2D, Sprite2D, ColorRect? Explore a little).
* Create an item object that could be anything you place in a grid slot.
* Create a snake object that will inherit from the item object.
* Create a food object that will inherit from the item object.

## Useful Tutorials and Resources

### 1. Godot

- [Godot Documentation](https://docs.godotengine.org/en/stable/index.html)
- [What is Godot Video](https://www.youtube.com/watch?v=QKgTZWbwD1U&list=PLu2_nk4Fitecf66b5E-WdarNafvAMBWjk)
- [Getting Started with Godot Video](https://www.youtube.com/watch?v=6YNKi3hcS5U&list=PLu2_nk4Fitecf66b5E-WdarNafvAMBWjk)
- [Godot GDScript Playground](https://gd.tumeo.space/) (Try out the examples and experiment!)

### 2. Git

- [What is Git Video](https://www.youtube.com/watch?v=hwP7WQkmECE)
- [Detailed Git Tutorial Video](https://www.youtube.com/watch?v=USjZcfj8yxE)
- [Merge Conflict Video](https://www.youtube.com/watch?v=DloR0BOGNU0)

### 3. General Game Development

- [Free Game Dev Tools Video](https://www.youtube.com/watch?v=HCOnHfXi8BE&list=PLu2_nk4Fitefqo5mMpbiG9Ok9E-f4DKxH)

### 4. Programming Music

- [Coffee in Seaside](https://www.youtube.com/watch?v=hO2FvV09F-A)