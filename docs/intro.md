First things first, open up R studio.

![R Studio at startup](images/rstudio-startup.png)

You should see something like the above; a window with three panes - a **Console** with some introductory text and a blue `>` prompt, an empty **Enviroment** and a **Files** browser showing the contents of the current directory.

Lets start with some very basic commands.
You need to select the **Console** window and type after the `>` prompt (and type *Enter* after each command to execute).

In the rest of the text we will use the following conventions (which echo what you will see in your **Command** window):

*  Commands will be shown with a preceding `>` prompt. Note: You must **not** type `>` in as part of the command.
*  The output expected from *R* will be preceded by a number in square brackets (for example `[1]`)

## Basic maths

*R* can be used as a simple calculator.
As in many programming languages, multiply is `*` and divide is `/`.


### Addition

```R
> 1 + 2

[1] 3
```

### Division

```R
> 1 / 2

[1] 0.5
```

### Multiplication

```R
> 2 * 2

[1] 4
```

## Keeping the results of calculations

If this was the only thing *R* could do it would be pretty useless.
We need to be able to store the results of a command with a name in order to use it again later.
In programming this is called assigning a value in a *variable*.
In *R* there are two commands to assign a value to a variable; `<-` and `=`.
Try the following:

`my_result <- 7 + 3`

Note how there is now no output with square brackets.
To see the value in the variable `my_result` use the following command:

`print(my_result)`

You will also see that `my_result` has been added to the **Values** section of the **Environment** pane (top right) in *R Studio*.

## Getting help

We have just used our first *R* function - `print`.
Functions take input surrounded by brackets.

To get more information on how to use a function you can use `?`, for example:

`?print`

Information on the function will be shown in the **Help** tab of the bottom right pane in *R Studio*.
You can get return to the **Files** information at any time from the tab list.
