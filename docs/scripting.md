A key to making your science reproducible is making the steps involved in your analysis available to others (and indeed your future self).
A script is nothing more complicated that a file containing all of the commands that you want to run on your data which can be executed again.

The fact that you have recorded your steps means that not only can you reproduce what you did in the past, but you can quickly re-apply the same steps to a new dataset.

## Creating a script in R Studio

Open a new file from the menu by selecting *File* -> *New File* -> *R Script* (or use the keyboard shortcut *Ctrl* + *Shift* + *N*).
An empty file will appear in the pane above the **Console**.

Write commands into this pane to:

1. load the original titanic data
2. remove lines with no values provided for the passengers *Age* 
3. save a new file into this pane

We have already seen how do all of these steps.
All that is required is to put them together in the correct order.

You can provide information on what the lines do using comments.
Comments are lines beginning with `#` which are ignored by *R* but can be read by people looking at your script.
Your scripts should look something like:

```
# Load the original data
train <- read.csv('titanic-train.csv')

# Remove rows with no Age value in original data
has_age <- train[!is.na(train$Age), ]

# Save data with valid Ages
write.csv(has_age, file='validated.csv', row.names=FALSE)
```

Save this as a file using the menu selection *File* -> *Save* (or the shortcut *Ctrl* + *S*).
Call the file 'remove-nas.R', as the standard extension for an *R* script is '.R'.

## Sourcing the script

If the same variable names are in the script as were entered before then this will be over written.
Also, where a variable is used in the script but not given a value it can use these earlier entries.
In order to ensure our script can be used in future, even if we haven't entered any commands, we need to remove the versions of variables we have created previously.
Use the menu option *Session* -> *Clear Workspace* to do this.

Now we can execute the script.
There are several different ways to do this:

- From the main menu select *Code* -> *Source*
- Select the *Source* button on the script pane 
- Use the keyboard shortcut *Ctrl* + *Shift* + *S*

Once run, you should see `train` and `has_age` in the **Data** section of the **Environment** pane.
Check that these contain the data as expected (perhaps also look in the 'validated.csv' file).
