# Advanced graphing with ggplot2

In this section we will recreate a graph from the Economist (shown below), providing a crash course in making beautiful figures with ggplot2.

![Economist - Corruption and development graph](images/economist.png)

This was originally used as a challenge in the Harvard tutorial available [here](http://tutorials.iq.harvard.edu/R/Rgraphics/Rgraphics.html).
It is well worth checking out that tutorial to get a better understanding of the steps used here to build up the graph.

## Obtaining the data

We can load the data the graph is based on directly from the tutorial website using:

```
econ <- read.csv("https://dww100.github.io/nc3rs-r-tutorial/data/economist.csv")
```

The data is available [here](data/economist.csv) to download and read from the file system if you prefer.

Investigate the data using either the *R Studio* data viewer or using the command:

```
head(econ)
```

The two columns we are most interested in are `CPI` (Corruptions Perception Index) and `HDI` (Human Development Index).

## Create a simple plot 

To create a scatter plot of the data with `CPI` on the x-axis and `HDI` on the y-axis enter the folowing:

```
> ggplot(econ, aes(x = CPI, y = HDI)) +
  geom_point()
```

As in the earlier example the `ggplot` command here creates the plot object and selects the `CPI` and `HDI` columns to be the x and y variables.
`geom_point` then adds the scatter plot layer.
Your plot should look something like the one below.

![](images/economist-basic-scatter.png)

This looks pretty bland and no distinction has been made between the points representing data different regions of the world.
To brighten the graph up lets color the points based on `Region` and alter the dots to hollow points (as used in the Economist graph).

```
>ggplot(econ, aes(x = CPI, y = HDI)) + 
  geom_point(aes(color = Region), shape = 1)
```

[Next]()
