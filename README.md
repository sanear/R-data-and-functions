# Data and Functions in R

This repository serves as a primer on the basic data structures in R. It mostly describes things by analogy to other programming languages, so it will be most useful to someone who knows C, Java, Python, or something with meaningful types (looking at you, Javascript).

It was intended to go along with a short presentation, but if you just run each line and read the comments, it should still be useful.

## DATATYPES
#### The basics: core types
The first bricks of code go over the four core types: `numeric` (floating-point or integer), `character` (string), `logical` (boolean), and `factor` (an indexed character vector representing a categorical variable) which has one or more `levels`. There is also a fifth type, `ordered`, but it's just a factor where ordinal comparisons can be made between `levels`.

The key concept here is that all variables are vectors. `num <- 1` (`<-` is the assignment operator) makes a vector of class `numeric` with length 1. There is no such thing as a single value in R, only collections.

#### Data structures
This section covers more general operations to construct the basic composite types - `vector`, as we said, is the most basic type. All values are contained in a `vector` or some more complex structure.
The other types:

- `matrix`: a vector combined with a row count and a column count to specify dimensions.
- `array`: a matrix with more than two dimensions, still stored the same way under the hood.
- `list`: basically analogous to `struct`, containing named members of arbitrary type (including functions) and length.
- `data.frame`: a `list` in which each element must be of the same length. This is the most commonly-used structure, as it is analogous to a spreadsheet or database table.

Each of these types has some particular nuance when it comes to referencing members. Go over the section on referencing carefully.

## FUNCTIONS
This section goes over how to describe, modify, and combine objects of the above types. It also describes what is maybe the biggest hurdle to a new R programmer: `apply()`. Basically, you can write a standard for-loop, but it is almost never idiomatic, because the looping is done in the interpreted scripting layer rather than in compiled C or Fortran code. Using `apply()` (and its cousins `sapply()` and `lapply()`) will produce much faster code.

## OBJECT-ORIENTATION
This is not as important as I thought when I wrote this thing, but it can't hurt. R has some loose object-orientation which is only really necessary for production code or for packages intended for others to use. This section is pretty self-explanatory, but the basic points are that (a) objects are just lists, and (b) class is just a special character vector belonging to the list which is interpreted by `class()` and other functions to impose type restrictions.

There is also something called `S4` which I'm told is a much more accurate implementation of OO principles, but I don't know anything about it.

## FURTHER READING
This is really just the basics, intended smooth over some of R's rougher edges, particularly for folks who already know a more traditional language. To really get a handle on what makes R awesome, the Bible is Hadley Wickham's [book](http://r4ds.had.co.nz/intro.html). You'll also want to read up on some super-useful packages for data munging and plotting, [`dplyr`](http://dplyr.tidyverse.org/), [`ggplot2`](http://ggplot2.tidyverse.org/) and the rest of [`tidyverse`](https://www.tidyverse.org/packages/).
