A key to making your science reproducible is making the steps involved in your analysis available to others (and indeed your future self).
A script is nothing more complicated that a file containing all of the commands that you want to run on your data which can be executed again.

The fact that you have recorded your steps means that not only can you reproduce what you did in the past but quickly re-apply the same steps to a new dataset.

## Creating a script in R Studio

Open a new file from the menu by selecting *File* -> *New File* -> *R Script* (or use the keyboard shortcut *Ctrl* + *Shift* + *N*).
An empty file will appear in the pane above the **Console**.

Write the commands we have already used to load the original titanic data and remove lines with no values provided for the passengers *Age* and then save a new file into this pane.
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

In order that we can be sure our script correctly loads and edits the data we need to remove the version of the variables we have created previously.
Use the menu option *Session* -> *Clear Workspace* to do this.

Now we can execute the script.
There are several options of how to do this, from the main menu select *Code* -> *Source*, the *Source* button on the script pane or use the keyboard shortcut *Ctrl* + *Shift* + *S*.

Once run you should see `train` and `has_age` in the **Data** section of the **Environment** pane.
Check that these contain the data as expected (perhaps also look in the 'validated.csv' file).
