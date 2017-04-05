
In many situations we don't want or need to work with all the data but only a subset of the information.
*R* provides several ways to access only parts of the data you have read in.

## Subsetting

Perhaps the most common need is to filter your dataset to look at only that part that meets some criteria.
In *R* this is most simply done using the `subset` function.
Let's look at just the female passengers:

`> females <- subset(train, Sex == "female")`

Note that we use `==` here as we want an equality (`=` is used for assignment).
We can also use other comparisons, the full set of options is:

| Operator   | Description                 |
|------------|-----------------------------|
| <          | less than                   |
| <=         | less than or equal to       |
| <          | greater than                |
| <=         | greater than or equal to    |
| ==         | exactly equal to            |
| !=         | not equal to                |

Select data for passengers who are not in first class with:

`> commoners <- subset(train, Pclass > 1)`

You can combine multiple filters using the logical operators `&` for AND and `|` for OR:

`> female_commoners <- subset(train, Pclass > 1 & Sex == "female")`

Sometimes it is more useful to refer to specific rows, columns, or both using the `[]` notation.
*R* interprets numbers within square brackets as [row, column].
So for example `train[1,2]` would return `0` as Mr. Owen Harris Braund (the first passenger in our table) sadly did not survive (the second column is *Survived*).

We can select a value using just rows, just columns, or both, using column/row numbers.
We can also ask for a set of rows or columns, referred to as a
slice, using `:`.
For example to get all columns for the first 5 passengers (rows) use:

`> train[1:5, ]`

To get the first two columns for all passengers:

`> train[, 1:2]`

In these examples a blank entry for column or row selects all entries.
If we want to exclude a line we could use, for example if we believe Mr. Owen Harris Braund to have lied about his age, we can use a negative value:

`> no_braund <- train[-1,]`

You can obviously combine selections of both rows and columns:

`> train[-1, 1:2]`

This command would select the first two columns for everyone but the scandalous liar Braund.

## Dealing with NAs

We have already seen that the *Age* column in our data contains many *NA* values.
This can have an impact on calculations we perform on the data.
For example if we try to calculate the average age of passengers:

```
> mean(train$Age)

[1] NA
```

We can get a valid result if we remove all the *NA* values using:

```
> mean(train$Age, na.rm=TRUE)

[1] 29.69912
```

Rather than type this in every time we want to perform a calculation with the *Age*, it would be better to create a copy of the dataset but only including records with valid *Age* values.
This can be done by using the following command:

`> has_age <- train[!is.na(train$Age), ]`

This uses the `is.na` function on the *Age* column to create a filter that only selects the *NA* entries.
The `!` works as a logical NOT - we don't want to keep these *NA* entries after all.
This filter can then be used in the same way as we previously used ranges like `1:2` to select only the rows we want to keep.

There is a handy function that removes any rows with *NA* entries:

`> no_na <- na.omit(train)`

Be careful when you use if however as it will remove rows even if the *NA* is in a column that you don't wish to process.

## Saving processed data

Now we have made changes to our data we will probably want to keep them available for future analysis sessions.
To save a CSV file we can use the `write.csv` command, thus:

`> write.csv(has_age, file='validated.csv')`

Let's load up the file we saved using:

`> validated <- read.csv('validated.csv')`

Inspect `validated` and you will see we have a new and unwanted column *X*.
What has happened is that by default *R* saves a name for each row (we first encountered these when we examined the input data).
To prevent this use:

`> write.csv(has_age, file='validated.csv', row.names=FALSE)`
