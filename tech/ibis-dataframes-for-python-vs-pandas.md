---
title: Ibis DataFrames for Python, why I hate Pandas, and what I miss about dplyr
date: 2024-03-31 21:24:06
created: 2024-03-31 21:24:06
categories:
  - tech
  - python
  - data science
  - data manipulation
  - pandas
  - ibis
  - data engineering
  - analytics
draft: false
---
> I haven't used `ibis` as of writing this. Just reviewed the docs. 

# Data Manipulation in Python

I've been a Python data scientist for 5-6 years. I've never liked pandas. Ever.

It's because I started as a `tidyverse` data scientist in R. One of the things I've missed about using Python is `dplyr`, an R package for data manipulation. And when I started with Python it was in PySpark - it felt very similar to `dplyr`, except for the annoying JVM. 

It's amazing because everything is done by chaining, and it's able to manipulate in memory or translate to a spark or SQL backend for execution. (It's very easy to use base `dplyr` and then just run the same query in memory on a small dataframe or against `BigQuery` or something.)

This chaining also avoids the common readability problem with pandas wherein often you see df[x] = df[y] / df[b] on one line and that's repeated for multiple lines if you want to create multiple new variables. 

While `pandas` has the .pipe and .assign operators for chaining, they still require lambda functions, which get annoying. This Reddit thread explores the opinion I share: the api is inconsistent. [Reddit - Does anyone else hate pandas?](https://www.reddit.com/r/dataengineering/comments/146rj9m/does_anyone_else_hate_pandas/).

`Polars` makes this much cleaner with the with_columns operator, for example, which is also very similar to `PySpark`. But `polars` is Rust backend, not Java. Game, Set, Match `polars`. 

I'm not the only one who loves `dplyr` . There have been several Python attempts to build `dplyr` in the Python ecosystem. 
There were great packages like [GitHub - coursera/pandas-ply: functional data manipulation for pandas](https://github.com/coursera/pandas-ply) (9 years since last commit), and [GitHub - dodger487/dplython: dplyr for python](https://github.com/dodger487/dplython), not updated in 7 years. Then there's the `dfply` [package](https://github.com/kieferk/dfply) that hasn't been maintained in 5 years (see [tutorial](https://towardsdatascience.com/dplyr-style-data-manipulation-with-pipes-in-python-380dcb137000)).

The `siuba` package is the latest Python `dplyr` incantation that is actively maintained: [GitHub - machow/siuba: Python library for using dplyr like syntax with pandas and SQL](https://github.com/machow/siuba) and can also execute against a SQL backend, but it can't execute a polars backend. 
# Ibis to solve my problems?

I just came across `ibis` however, and it seems really promising. Turns out it was [created](https://ibis-project.org/concepts/who) in 2015 by Wes McKinney, who created the pandas pyarrow backend to solve the [ “10 Things I Hate About pandas”](https://wesmckinney.com/blog/apache-arrow-pandas-internals/). More on the 

- [Ibis](https://ibis-project.org/)
- [Ibis – getting\_started](https://ibis-project.org/tutorials/getting_started)
- [Ibis – Analysis of World of Warcraft data](https://ibis-project.org/posts/wow-analysis/)

![](../img/screenshot-ibis-data.jpeg){.preview-image}

It looks like `dplyr` (for example it even copies some syntax like mutate() for adding new columns and select for picking columns). But, the benefit is it has `polars` and `pandas` as backends, but also offers `PySpark` (should someon need to use databricks as a backend compute engine). And it can also translate into SQL. Sure, polars can do this too: [Databases - Polars user guide](https://docs.pola.rs/user-guide/io/database/). But `ibis` seems more extensive. 

This means I could have one programming language to execute either `polars`, SQL, or PySpark, rather than have both `polars` and SQL or `pandas` in my pipeline in different places. (Side note: why would I use `pandas` as a backend though when `polars` is so fast?)

I just discovered this over the weekend. Would love your thoughts! I'm sure there are limitations vs raw polars/pandas that are hidden from my quick overview. 

# Appendix

The most annoying thing about `pandas` is the `.transform()` operator. I hate it. Just hate it. It never makes sense and I always have to look it up. This essentially just does a window operation. 

You don't need this until you need to do some type of aggregation within a group. Let's assume you want to calculate the fraction of sales attributed to a city within a state. (What fraction of sales in California come from San Francisco, for example.)

Read the following and consider for yourself what's simplest:

```
import pandas as pd

# Sample data
data = {
    'State': ['CA', 'CA', 'CA', 'NY', 'NY', 'NY'],
    'City': ['SF', 'LA', 'SF', 'NYC', 'Buffalo', 'NYC'],
    'Sales': [100, 200, 150, 300, 100, 200]
}

df = pd.DataFrame(data)

# Calculate fraction of sales by city within state
df['Fraction'] = df.groupby('State')['Sales'].apply(lambda x: x / x.sum())

print(df)
``` 

Polars:

``` 
import polars as pl

df = pl.DataFrame(data)

# Calculate fraction of sales by city within state
df = df.with_column(
  pl.col('Sales') / df.groupby('State').agg(pl.sum('Sales'))['sum'])

print(df)
```

Dplyr:

```
library(dplyr)

# Calculate fraction of sales by city within state
df <- data %>%
  group_by(State) %>%
  mutate(Fraction = Sales / sum(Sales))
``` 

Ibis: 
```
import ibis

# Calculate fraction of sales by city within state
expr = sales.mutate(Fraction=sales['Sales'] / sales.groupby('State').Sales.sum())

result = expr.execute()
print(result)
```

It may not look all that different, but pandas has this weird syntax where you group by (something) but then select a column with brackets. But sometimes you can use periods to select the column. 

The polars and ibis implementations seem simple, but overly verbose. 

Then there's the `dplyr`. So elegant and simple. The `sum()` operator is summing within the group, and the `sales/sum(sales)` is very easy to read. 

In pandas I'm left wondering what is `x/x.sum()` and why this `lambda` thing? 

This is a very simple example, but the more you get into the weeds the more my point becomes obvious. 

The benefits of `dplyr` come from when you want to do 10 mutates in one go. It's so simple. In pandas that's 10 lambda functions with a .assign operator. 

Like, look at `pandas` trying to do this:

```
import pandas as pd

# Sample data
data = {
    'A': list(range(1, 11)),
    'B': list(range(11, 21)),
    'C': list(range(21, 31))
}

df = pd.DataFrame(data)

# Using assign to create 10 new columns
df = df.assign(
    # New columns with various transformations
    A_Squared=lambda x: x['A']**2,
    B_Squared=lambda x: x['B']**2,
    C_Squared=lambda x: x['C']**2,
    A_Cubed=lambda x: x['A']**3,
    B_Cubed=lambda x: x['B']**3,
    C_Cubed=lambda x: x['C']**3,
    A_Log=lambda x: np.log(x['A']),
    B_Log=lambda x: np.log(x['B']),
    C_Log=lambda x: np.log(x['C']),
    A_B=lambda x: x['A'] * x['B']
)

print(df)
```

Now look at `dplyr`:

```
library(dplyr)

# Sample data
data <- data.frame(
  A = 1:10,
  B = 11:20,
  C = 21:30
)

# Using mutate to create 10 new columns
df <- data %>%
  mutate(
    # New columns with various transformations
    A_Squared = A^2,
    B_Squared = B^2,
    C_Squared = C^2,
    A_Cubed = A^3,
    B_Cubed = B^3,
    C_Cubed = C^3,
    A_Log = log(A),
    B_Log = log(B),
    C_Log = log(C),
    A_B = A * B
  )

print(df)
```

Now let's complicate it, where each manipulation takes in a previous column:

```
import pandas as pd

# Create a DataFrame
df = pd.DataFrame({'A': [10, 20, 30, 40, 50]})

# Mutate operations
df['B'] = df['A'] ** 2
df['C'] = df['A'] + df['B'] * 2
df['D'] = df['B'] / 2
df['E'] = df['C'] - df['A']
df['F'] = df['A'] * 5
df['G'] = df['D'] - df['E']
df['H'] = df['F'] + df['G']
df['I'] = df['D'] ** 2
df['J'] = df['H'] / df['I']
df['K'] = df['I'] - df['J']

print(df)
```

This is how most people write pandas. They write `df` 26 times. 

Let's look at pandas using the `assign` operator:

```
import pandas as pd

# Create a DataFrame
df = pd.DataFrame({'A': [10, 20, 30, 40, 50]})

# Mutate operations with assign and lambda functions
df = df.assign(
    B=lambda x: x['A'] ** 2,
    C=lambda x: x['A'] + x['B'] * 2,
    D=lambda x: x['B'] / 2,
    E=lambda x: x['C'] - x['A'],
    F=lambda x: x['A'] * 5,
    G=lambda x: x['D'] - x['E'],
    H=lambda x: x['F'] + x['G'],
    I=lambda x: x['D'] ** 2,
    J=lambda x: x['H'] / x['I'],
    K=lambda x: x['I'] - x['J']
)

print(df)
```
Slightly better but still an eyesore. 10 lambda statements and still 26 `x` calls. 

And in R:

```
library(dplyr)

# Create a tibble
df <- tibble(A = c(10, 20, 30, 40, 50))

# Mutate operations
df <- df %>%
  mutate(B = A ^ 2,
         C = A + B * 2,
         D = B / 2,
         E = C - A,
         F = A * 5,
         G = D - E,
         H = F + G,
         I = D ^ 2,
         J = H / I,
         K = I - J)

print(df)
```

It's just so simple. So elegant. So beautiful. No wasted text. Very easy to read. 

Ibis seems similar to dplyr but requires the `D = _.["B"]/2` operation. [Ibis – basics - mutating columns](https://ibis-project.org/tutorials/cloud-data-platforms/starburst-galaxy/1_basics.html#mutating-columns)