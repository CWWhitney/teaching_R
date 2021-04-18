<style>
.section .reveal .state-background {
    background: white;}
.section .reveal h1,
.section .reveal p {
    color: black;
    position: relative;
    top: 1%;}
</style>
    
<style>
.footer {
    color: black; background: white;
    position: fixed; top: 100%;
    text-align:left; width:100%;
}

</style>

<!-- enable caching globally for the presentation with this code chunk: If you run into problems with cached output you can always use the Clear Knitr Cache command on the More menu to rebuild your presentation without previously cached output. -->
    



Data Wrangling
========================================================
author: Cory Whitney
font-family: 'Helvetica'
autosize: true
css: mySlideTemplate.css

<img src="Data_Wrangling-figure/wrangler.png" style="background:none; border:none; box-shadow:none;height="200"; width="200";"><img src="Data_Wrangling-figure/INRES_Logo.png" style="background:none; border:none; box-shadow:none;height="100"; width="100";"><img src="Data_Wrangling-figure/Uni_Bonn_Picture.png" style="background:none; border:none; box-shadow:none;height="200"; width="200";"><img src="Data_Wrangling-figure/ZEF_Logo.png" style="background:none; border:none; box-shadow:none;height="200"; width="200";">

<div class="footer"></small>cory.whitney@uni-bonn.de </small></div>

Overview
====================================
incremental: true
right: 70%
<img src="Data_Wrangling-figure/tidyR.png" style="background:none; border:none; box-shadow:none;height="30%"; width="30%";">

<img src="Data_Wrangling-figure/dplyr.png" style="background:none; border:none; box-shadow:none;height="50%"; width="50%";">


***
- Notes on R
- Tidy code style using tidyR 
- Clean and intuitive functions using dplyr
- Concise code using magrittr 'Ceci n'est pas une pipe'

![](Data_Wrangling-figure/magrittr.png)

Notes on R: About process
========================================================
incremental: true

- "[...] writing R code is a hedonistically artistic, left-brained, paint-in-your-hair sort of experience [...] 
- learn how to code the same way we learned how to catch salamanders as children – trial and error, flipping over rocks till we get a reward [...] 
- once the ecstasy of creation has swept over us, we awake late the next morning to find our canvas covered with 2100 lines of R code [...] 
- Heads throbbing with a statistical absinthe hangover, we trudge through it slowly over days, trying to figure out what we did."

<img src="Data_Wrangling-figure/andrew_macdonald.png" style="background:none; border:none; box-shadow:none; box-shadow:none;height="10%"; width="10%";">Andrew MacDonald  @polesasunder </small>


Notes on R: Focus
========================================================

<img src="Data_Wrangling-figure/Focus.png" style="background:none; border:none; box-shadow:none;height="40%"; width="40%";">


Notes on R: Keeping track of work
========================================================
incremental: true
right: 80%
![](Data_Wrangling-figure/tidyR.png)

Keep it tidy
***

Use `#` to annotate and not run

If not Rmarkdown then at least use `----` or `####` 

`# Section 1 ----`

`# Section 2 ####`

`# Section 3 ####`

<span style="font-weight:bold; color:red;">TOC in upper right console</span>

<!-- End Part 1 -->

<!-- Begin Part 2 -->

<div class="footer" style="margin-top;font-size:60%;"> 
http://style.tidyverse.org/ </div>

Notes on tidy R
========================================================
incremental: true
right: 80%
![](Data_Wrangling-figure/tidyR.png)

Keep it tidy
***
Check your R version
```
version
```
The easiest way to get libraries for today is to install the whole tidyverse:


```r
library(tidyverse)
```
<div class="footer" style="margin-top;font-size:60%;"> 
http://style.tidyverse.org/ </div>

Notes on tidy R browseVignettes
========================================================
incremental: true
![](Data_Wrangling-figure/tidyR.png)

Keep it tidy

Learn about tidyverse with browseVignettes:


```r
browseVignettes(package = "tidyverse")
```
<div class="footer" style="margin-top;font-size:60%;"> 
http://style.tidyverse.org/ </div>


The tidy tools manifesto
========================================================
incremental: true
![](Data_Wrangling-figure/tidy_paper.jpg)
<!-- <img src="Data_Wrangling-figure/hadley_wickham.png" style="background:none; border:none; box-shadow:none;height="40%"; width="40%";">   -->
<!-- Hadley Wickham -->

Notes on R: tidyR process
========================================================
incremental: true
right: 80%
![](Data_Wrangling-figure/tidyR.png)

Keep it tidy
***

<img src="Data_Wrangling-figure/tidyR_process.png" style="background:none; border:none; box-shadow:none;height="100%"; width="100%";">

- Good coding style is like correct punctuation:
- withoutitthingsarehardtoread

<div class="footer" style="margin-top;font-size:60%;"> 
http://style.tidyverse.org/ </div>

Notes on R: Keep your data tidy
========================================================
incremental: true
right: 80%
![](Data_Wrangling-figure/tidyR.png)

Keep it tidy
***

- Keep your data tidy
- When your data is tidy, each column is a variable, and each row is an observation
- Consistent structure lets you focus your struggle on questions about the data, not fighting to get the data into the right form for different functions

<img src="Data_Wrangling-figure/wrangler.png" style="background:none; border:none; box-shadow:none;height="20%"; width="20%";">

<div class="footer" style="margin-top;font-size:60%;"> 
http://style.tidyverse.org/ </div>

Notes on R: Tidy Data
========================================================
incremental: true

Three things make a dataset tidy:
- Each variable with its own column.
- Each observation with its own row.
- Each value with its own cell.

<img src="Data_Wrangling-figure/tidydata.png" style="background:none; border:none; box-shadow:none;height="90%"; width="90%";">

<div class="footer" style="margin-top;font-size:60%;"> 
H. Wickham, Tidy Data, Journal of Statistical Software, 59(10) www.jstatsoft.org/v59/i10/paper </div>


Wrangling: transform
========================================================
incremental: true

- Once you have __tidy__ data, a common first step is to __transform__ it
- narrowing in on observations of interest
- creating new variables that are functions of existing variables
- calculating a set of summary statistics

<img src="Data_Wrangling-figure/Wrangling_Data.png" style="background:none; border:none; box-shadow:none;height="40%"; width="40%";"> www.codeastar.com/data-wrangling/ 

Wrangling: dplyr arguments
========================================================
incremental: true
<small>Format of __dplyr__</small> <img src="Data_Wrangling-figure/dplyr.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";"> 

<img src="Data_Wrangling-figure/hadley_wickham.png" style="background:none; border:none; box-shadow:none;height="50%"; width="50%";"> 
Arguments start with a data frame

***
- __select__: return a subset of the columns
- __filter__: extract a subset of rows
- __rename__: rename variables
- __mutate__: add new variables and columns or transform
- __group_by__: split data into groups
- __summarize__: generate tables of summary statistics

<div class="footer" style="margin-top;font-size:60%;"> 
https://dplyr.tidyverse.org/ </div>

Getting your data in R
========================================================
incremental: true
<small>Load data</small> <img src="Data_Wrangling-figure/R_logo.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";">

- Load the data

```r
participants_data <- read.csv("participants_data.csv")
```
- Keep your data in the same folder structure as .RProj
- at or below the level of .RProj

Use `head` in R
========================================================
incremental: true
<small>Load data</small> <img src="Data_Wrangling-figure/R_logo.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";">

- Look at the top rows of the data with the `head` function.

```r
head(participants_data)
```

```
  batch age gender continent_of_origin research_continent
1  2017  33      F              Europe             Europe
2  2017  31      F       South America      South America
3  2017  30      F       South America      South America
4  2017  28      M              Africa             Africa
5  2017  30      M              Africa             Africa
6  2017  30      M              Africa             Africa
  number_of_publications working_hours_per_day number_of_siblings
1                      6                     8                  1
2                      0                     8                  2
3                      1                     7                  2
4                      1                    16                  1
5                      3                    12                  5
6                      3                    16                  4
  academic_parents km_home_to_zef years_of_study days_to_email_response
1                N            1.7             20                      1
2                Y           40.0              9                      1
3                N        10370.0              7                      1
4                Y           15.0              3                      1
5                N            6.0              7                      1
6                N            8.3             10                      2
  letters_in_first_name
1                     4
2                     6
3                     7
4                     7
5                     6
6                     6
```

Use `names` in R
========================================================
incremental: true
<small>Load data</small> <img src="Data_Wrangling-figure/R_logo.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";">

- Check the names of the variables in the data with the `names` function.

```r
head(participants_data)
```

```
  batch age gender continent_of_origin research_continent
1  2017  33      F              Europe             Europe
2  2017  31      F       South America      South America
3  2017  30      F       South America      South America
4  2017  28      M              Africa             Africa
5  2017  30      M              Africa             Africa
6  2017  30      M              Africa             Africa
  number_of_publications working_hours_per_day number_of_siblings
1                      6                     8                  1
2                      0                     8                  2
3                      1                     7                  2
4                      1                    16                  1
5                      3                    12                  5
6                      3                    16                  4
  academic_parents km_home_to_zef years_of_study days_to_email_response
1                N            1.7             20                      1
2                Y           40.0              9                      1
3                N        10370.0              7                      1
4                Y           15.0              3                      1
5                N            6.0              7                      1
6                N            8.3             10                      2
  letters_in_first_name
1                     4
2                     6
3                     7
4                     7
5                     6
6                     6
```

Use `str` in R
========================================================
incremental: true
<small>Load data</small> <img src="Data_Wrangling-figure/R_logo.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";">

- Look at the structure of the data with the `str` function.

```r
str(participants_data)
```

```
'data.frame':	32 obs. of  13 variables:
 $ batch                 : int  2017 2017 2017 2017 2017 2017 2017 2017 2017 2018 ...
 $ age                   : int  33 31 30 28 30 30 33 30 27 32 ...
 $ gender                : chr  "F" "F" "F" "M" ...
 $ continent_of_origin   : chr  "Europe" "South America" "South America" "Africa" ...
 $ research_continent    : chr  "Europe" "South America" "South America" "Africa" ...
 $ number_of_publications: int  6 0 1 1 3 3 0 2 0 2 ...
 $ working_hours_per_day : int  8 8 7 16 12 16 3 8 9 8 ...
 $ number_of_siblings    : int  1 2 2 1 5 4 7 1 2 3 ...
 $ academic_parents      : chr  "N" "Y" "N" "Y" ...
 $ km_home_to_zef        : num  1.7 40 10370 15 6 ...
 $ years_of_study        : int  20 9 7 3 7 10 6 7 6 20 ...
 $ days_to_email_response: int  1 1 1 1 1 2 2 2 3 3 ...
 $ letters_in_first_name : int  4 6 7 7 6 6 5 7 5 4 ...
```

Use `$` in R
========================================================
incremental: true
<small>Load data</small> <img src="Data_Wrangling-figure/R_logo.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";">

- Call a particular variable in your data with `$`

```r
participants_data$age
```

```
 [1] 33 31 30 28 30 30 33 30 27 32 32 36 43 32 28 28 33 31 34 29 31 37 34 23 35
[26] 37 29 32 27 36 29 32
```


Wrangling: dplyr library
========================================================
incremental: true
left: 40%
<small>Using __dplyr__</small> <img src="Data_Wrangling-figure/dplyr.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";"> 


```r
library(dplyr)
```

and others we need today

```r
library(knitr)
library(tidyr)
library(dplyr)
library(magrittr)
```

***

<small>Roger Peng</small> <img src="Data_Wrangling-figure/Roger_Peng.png" style="background:none; border:none; box-shadow:none;height="40%"; width="40%";">

<img src="Data_Wrangling-figure/github.png" style="background:none; border:none; box-shadow:none;height="40%"; width="40%";"> <small>genomicsclass.github.io/book/pages/dplyr_tutorial</small>


<div class="footer" style="margin-top;font-size:60%;"> 
https://dplyr.tidyverse.org/ </div>


Wrangling: dplyr::select 
========================================================
incremental: true
<small>Subsetting</small> <img src="Data_Wrangling-figure/dplyr.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";">

__Select__

- Create a subset of the data with the `select` function

```r
select(participants_data, 
       academic_parents,
       working_hours_per_day)
```

```
   academic_parents working_hours_per_day
1                 N                     8
2                 Y                     8
3                 N                     7
4                 Y                    16
5                 N                    12
6                 N                    16
7                 N                     3
8                 N                     8
9                 Y                     9
10                N                     8
11                N                    10
12                Y                     7
13                N                     8
14                N                     8
15                N                     7
16                N                     6
17                Y                     8
18                Y                     4
19                Y                     8
20                N                     8
21                N                     6
22                Y                     6
23                Y                     5
24                N                     3
25                N                     6
26                Y                     6
27                Y                     3
28                Y                     8
29                N                     8
30                N                     6
31                N                     8
32                N                     8
```

<div class="footer" style="margin-top;font-size:60%;"> 
https://dplyr.tidyverse.org/ </div>

Wrangling: dplyr::select (-)
========================================================
incremental: true
<small>Subsetting</small> <img src="Data_Wrangling-figure/dplyr.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";">

__Select__


```r
select(participants_data,
       -academic_parents,
       -working_hours_per_day)
```

```
   batch age gender continent_of_origin research_continent
1   2017  33      F              Europe             Europe
2   2017  31      F       South America      South America
3   2017  30      F       South America      South America
4   2017  28      M              Africa             Africa
5   2017  30      M              Africa             Africa
6   2017  30      M              Africa             Africa
7   2017  33      F              Africa             Africa
8   2017  30      F       South America      South America
9   2017  27      M              Europe             Europe
10  2018  32      F               China              China
11  2018  32      F                Asia               Asia
12  2018  36      M              Africa             Africa
13  2018  43      F       North America      North America
14  2018  32      M                Asia               Asia
15  2018  28      M                Asia               Asia
16  2018  28      F                Asia               Asia
17  2019  33      M                Asia               Asia
18  2019  31      F                Asia               Asia
19  2019  34      M              Africa             Africa
20  2019  29      M       South America             Africa
21  2019  31      F       South America      South America
22  2019  37      M                Asia               Asia
23  2019  34      M                Asia               Asia
24  2019  23      F                Asia             Africa
25  2019  35      M       South America      South America
26  2017  37      M                Asia               Asia
27  2019  29      F                Asia               Asia
28  2012  32      F                Asia               Asia
29  2019  27      F       South America      South America
30  2019  36      F                Asia               Asia
31  2019  29      M       South America             Africa
32  2019  32      M              Africa             Africa
   number_of_publications number_of_siblings km_home_to_zef years_of_study
1                       6                  1           1.70             20
2                       0                  2          40.00              9
3                       1                  2       10370.00              7
4                       1                  1          15.00              3
5                       3                  5           6.00              7
6                       3                  4           8.30             10
7                       0                  7           9.00              6
8                       2                  1          65.00              7
9                       0                  2           1.00              6
10                      2                  3           3.00             20
11                      2                  2           4.30             18
12                     10                  6           7.90             18
13                      2                  5           0.13             18
14                      2                  6           4.10             18
15                      0                  5           4.00             17
16                      0                  2           4.00             17
17                      2                  3         104.00             17
18                      2                  3          23.80             12
19                      2                  2           8.20             12
20                      2                  0           4.00             12
21                      3                  2           1.10             12
22                      3                  3       10311.00             12
23                      6                  2           8.00             12
24                      0                  1           3.60             12
25                     10                  2           4.80             12
26                      3                  3       10300.00             17
27                      2                  2           3.00             10
28                     10                  1        6700.00             20
29                      2                  1           2.10             19
30                      3                  4           2.50             19
31                      2                  0           4.00             18
32                      1                  4           6.00             20
   days_to_email_response letters_in_first_name
1                       1                     4
2                       1                     6
3                       1                     7
4                       1                     7
5                       1                     6
6                       2                     6
7                       2                     5
8                       2                     7
9                       3                     5
10                      3                     4
11                      1                     5
12                      1                     8
13                      1                     8
14                      1                     6
15                      1                     5
16                      1                     5
17                      1                     6
18                      1                     5
19                      1                     7
20                      3                     5
21                      3                     8
22                      4                     7
23                      4                     4
24                      4                     6
25                      4                     6
26                      2                     7
27                      1                     5
28                      1                     5
29                      1                     4
30                      2                     5
31                      1                     5
32                      1                     5
```

<div class="footer" style="margin-top;font-size:60%;"> 
https://dplyr.tidyverse.org/ </div>

Wrangling: dplyr::filter
========================================================
incremental: true
<small>Subsetting</small> <img src="Data_Wrangling-figure/dplyr.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";">


__Filter__

Create a subset of the data with the `filter` function

```r
filter(participants_data, 
       working_hours_per_day >10)
```

```
  batch age gender continent_of_origin research_continent
1  2017  28      M              Africa             Africa
2  2017  30      M              Africa             Africa
3  2017  30      M              Africa             Africa
  number_of_publications working_hours_per_day number_of_siblings
1                      1                    16                  1
2                      3                    12                  5
3                      3                    16                  4
  academic_parents km_home_to_zef years_of_study days_to_email_response
1                Y           15.0              3                      1
2                N            6.0              7                      1
3                N            8.3             10                      2
  letters_in_first_name
1                     7
2                     6
3                     6
```

<div class="footer" style="margin-top;font-size:60%;"> 
https://dplyr.tidyverse.org/ </div>

Wrangling: dplyr::filter (multiple)
========================================================
incremental: true
<small>Subsetting</small> <img src="Data_Wrangling-figure/dplyr.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";">


__Filter__


```r
filter(participants_data, 
       working_hours_per_day >10 & 
         letters_in_first_name >6)
```

```
  batch age gender continent_of_origin research_continent
1  2017  28      M              Africa             Africa
  number_of_publications working_hours_per_day number_of_siblings
1                      1                    16                  1
  academic_parents km_home_to_zef years_of_study days_to_email_response
1                Y             15              3                      1
  letters_in_first_name
1                     7
```

<div class="footer" style="margin-top;font-size:60%;"> 
https://dplyr.tidyverse.org/ </div>

Wrangling: dplyr::rename name_length
========================================================
incremental: true
<small> __Rename__ </small> <img src="Data_Wrangling-figure/dplyr.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";">



```r
rename(participants_data, 
       name_length = letters_in_first_name)
```

```
   batch age gender continent_of_origin research_continent
1   2017  33      F              Europe             Europe
2   2017  31      F       South America      South America
3   2017  30      F       South America      South America
4   2017  28      M              Africa             Africa
5   2017  30      M              Africa             Africa
6   2017  30      M              Africa             Africa
7   2017  33      F              Africa             Africa
8   2017  30      F       South America      South America
9   2017  27      M              Europe             Europe
10  2018  32      F               China              China
11  2018  32      F                Asia               Asia
12  2018  36      M              Africa             Africa
13  2018  43      F       North America      North America
14  2018  32      M                Asia               Asia
15  2018  28      M                Asia               Asia
16  2018  28      F                Asia               Asia
17  2019  33      M                Asia               Asia
18  2019  31      F                Asia               Asia
19  2019  34      M              Africa             Africa
20  2019  29      M       South America             Africa
21  2019  31      F       South America      South America
22  2019  37      M                Asia               Asia
23  2019  34      M                Asia               Asia
24  2019  23      F                Asia             Africa
25  2019  35      M       South America      South America
26  2017  37      M                Asia               Asia
27  2019  29      F                Asia               Asia
28  2012  32      F                Asia               Asia
29  2019  27      F       South America      South America
30  2019  36      F                Asia               Asia
31  2019  29      M       South America             Africa
32  2019  32      M              Africa             Africa
   number_of_publications working_hours_per_day number_of_siblings
1                       6                     8                  1
2                       0                     8                  2
3                       1                     7                  2
4                       1                    16                  1
5                       3                    12                  5
6                       3                    16                  4
7                       0                     3                  7
8                       2                     8                  1
9                       0                     9                  2
10                      2                     8                  3
11                      2                    10                  2
12                     10                     7                  6
13                      2                     8                  5
14                      2                     8                  6
15                      0                     7                  5
16                      0                     6                  2
17                      2                     8                  3
18                      2                     4                  3
19                      2                     8                  2
20                      2                     8                  0
21                      3                     6                  2
22                      3                     6                  3
23                      6                     5                  2
24                      0                     3                  1
25                     10                     6                  2
26                      3                     6                  3
27                      2                     3                  2
28                     10                     8                  1
29                      2                     8                  1
30                      3                     6                  4
31                      2                     8                  0
32                      1                     8                  4
   academic_parents km_home_to_zef years_of_study days_to_email_response
1                 N           1.70             20                      1
2                 Y          40.00              9                      1
3                 N       10370.00              7                      1
4                 Y          15.00              3                      1
5                 N           6.00              7                      1
6                 N           8.30             10                      2
7                 N           9.00              6                      2
8                 N          65.00              7                      2
9                 Y           1.00              6                      3
10                N           3.00             20                      3
11                N           4.30             18                      1
12                Y           7.90             18                      1
13                N           0.13             18                      1
14                N           4.10             18                      1
15                N           4.00             17                      1
16                N           4.00             17                      1
17                Y         104.00             17                      1
18                Y          23.80             12                      1
19                Y           8.20             12                      1
20                N           4.00             12                      3
21                N           1.10             12                      3
22                Y       10311.00             12                      4
23                Y           8.00             12                      4
24                N           3.60             12                      4
25                N           4.80             12                      4
26                Y       10300.00             17                      2
27                Y           3.00             10                      1
28                Y        6700.00             20                      1
29                N           2.10             19                      1
30                N           2.50             19                      2
31                N           4.00             18                      1
32                N           6.00             20                      1
   name_length
1            4
2            6
3            7
4            7
5            6
6            6
7            5
8            7
9            5
10           4
11           5
12           8
13           8
14           6
15           5
16           5
17           6
18           5
19           7
20           5
21           8
22           7
23           4
24           6
25           6
26           7
27           5
28           5
29           4
30           5
31           5
32           5
```

<div class="footer" style="margin-top;font-size:60%;"> 
https://dplyr.tidyverse.org/ </div>

Wrangling: dplyr::rename (again)
========================================================
incremental: true
<small> __Rename__ </small> <img src="Data_Wrangling-figure/dplyr.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";">



```r
rename(participants_data, 
       commute = km_home_to_zef)
```

```
   batch age gender continent_of_origin research_continent
1   2017  33      F              Europe             Europe
2   2017  31      F       South America      South America
3   2017  30      F       South America      South America
4   2017  28      M              Africa             Africa
5   2017  30      M              Africa             Africa
6   2017  30      M              Africa             Africa
7   2017  33      F              Africa             Africa
8   2017  30      F       South America      South America
9   2017  27      M              Europe             Europe
10  2018  32      F               China              China
11  2018  32      F                Asia               Asia
12  2018  36      M              Africa             Africa
13  2018  43      F       North America      North America
14  2018  32      M                Asia               Asia
15  2018  28      M                Asia               Asia
16  2018  28      F                Asia               Asia
17  2019  33      M                Asia               Asia
18  2019  31      F                Asia               Asia
19  2019  34      M              Africa             Africa
20  2019  29      M       South America             Africa
21  2019  31      F       South America      South America
22  2019  37      M                Asia               Asia
23  2019  34      M                Asia               Asia
24  2019  23      F                Asia             Africa
25  2019  35      M       South America      South America
26  2017  37      M                Asia               Asia
27  2019  29      F                Asia               Asia
28  2012  32      F                Asia               Asia
29  2019  27      F       South America      South America
30  2019  36      F                Asia               Asia
31  2019  29      M       South America             Africa
32  2019  32      M              Africa             Africa
   number_of_publications working_hours_per_day number_of_siblings
1                       6                     8                  1
2                       0                     8                  2
3                       1                     7                  2
4                       1                    16                  1
5                       3                    12                  5
6                       3                    16                  4
7                       0                     3                  7
8                       2                     8                  1
9                       0                     9                  2
10                      2                     8                  3
11                      2                    10                  2
12                     10                     7                  6
13                      2                     8                  5
14                      2                     8                  6
15                      0                     7                  5
16                      0                     6                  2
17                      2                     8                  3
18                      2                     4                  3
19                      2                     8                  2
20                      2                     8                  0
21                      3                     6                  2
22                      3                     6                  3
23                      6                     5                  2
24                      0                     3                  1
25                     10                     6                  2
26                      3                     6                  3
27                      2                     3                  2
28                     10                     8                  1
29                      2                     8                  1
30                      3                     6                  4
31                      2                     8                  0
32                      1                     8                  4
   academic_parents  commute years_of_study days_to_email_response
1                 N     1.70             20                      1
2                 Y    40.00              9                      1
3                 N 10370.00              7                      1
4                 Y    15.00              3                      1
5                 N     6.00              7                      1
6                 N     8.30             10                      2
7                 N     9.00              6                      2
8                 N    65.00              7                      2
9                 Y     1.00              6                      3
10                N     3.00             20                      3
11                N     4.30             18                      1
12                Y     7.90             18                      1
13                N     0.13             18                      1
14                N     4.10             18                      1
15                N     4.00             17                      1
16                N     4.00             17                      1
17                Y   104.00             17                      1
18                Y    23.80             12                      1
19                Y     8.20             12                      1
20                N     4.00             12                      3
21                N     1.10             12                      3
22                Y 10311.00             12                      4
23                Y     8.00             12                      4
24                N     3.60             12                      4
25                N     4.80             12                      4
26                Y 10300.00             17                      2
27                Y     3.00             10                      1
28                Y  6700.00             20                      1
29                N     2.10             19                      1
30                N     2.50             19                      2
31                N     4.00             18                      1
32                N     6.00             20                      1
   letters_in_first_name
1                      4
2                      6
3                      7
4                      7
5                      6
6                      6
7                      5
8                      7
9                      5
10                     4
11                     5
12                     8
13                     8
14                     6
15                     5
16                     5
17                     6
18                     5
19                     7
20                     5
21                     8
22                     7
23                     4
24                     6
25                     6
26                     7
27                     5
28                     5
29                     4
30                     5
31                     5
32                     5
```
<div class="footer" style="margin-top;font-size:60%;"> 
https://dplyr.tidyverse.org/ </div>

Wrangling: dplyr::mutate
========================================================
incremental: true
<small> __Mutate__ </small> <img src="Data_Wrangling-figure/dplyr.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";">


```r
mutate(participants_data, 
       labor_mean = working_hours_per_day*
              mean(working_hours_per_day))
```

```
   batch age gender continent_of_origin research_continent
1   2017  33      F              Europe             Europe
2   2017  31      F       South America      South America
3   2017  30      F       South America      South America
4   2017  28      M              Africa             Africa
5   2017  30      M              Africa             Africa
6   2017  30      M              Africa             Africa
7   2017  33      F              Africa             Africa
8   2017  30      F       South America      South America
9   2017  27      M              Europe             Europe
10  2018  32      F               China              China
11  2018  32      F                Asia               Asia
12  2018  36      M              Africa             Africa
13  2018  43      F       North America      North America
14  2018  32      M                Asia               Asia
15  2018  28      M                Asia               Asia
16  2018  28      F                Asia               Asia
17  2019  33      M                Asia               Asia
18  2019  31      F                Asia               Asia
19  2019  34      M              Africa             Africa
20  2019  29      M       South America             Africa
21  2019  31      F       South America      South America
22  2019  37      M                Asia               Asia
23  2019  34      M                Asia               Asia
24  2019  23      F                Asia             Africa
25  2019  35      M       South America      South America
26  2017  37      M                Asia               Asia
27  2019  29      F                Asia               Asia
28  2012  32      F                Asia               Asia
29  2019  27      F       South America      South America
30  2019  36      F                Asia               Asia
31  2019  29      M       South America             Africa
32  2019  32      M              Africa             Africa
   number_of_publications working_hours_per_day number_of_siblings
1                       6                     8                  1
2                       0                     8                  2
3                       1                     7                  2
4                       1                    16                  1
5                       3                    12                  5
6                       3                    16                  4
7                       0                     3                  7
8                       2                     8                  1
9                       0                     9                  2
10                      2                     8                  3
11                      2                    10                  2
12                     10                     7                  6
13                      2                     8                  5
14                      2                     8                  6
15                      0                     7                  5
16                      0                     6                  2
17                      2                     8                  3
18                      2                     4                  3
19                      2                     8                  2
20                      2                     8                  0
21                      3                     6                  2
22                      3                     6                  3
23                      6                     5                  2
24                      0                     3                  1
25                     10                     6                  2
26                      3                     6                  3
27                      2                     3                  2
28                     10                     8                  1
29                      2                     8                  1
30                      3                     6                  4
31                      2                     8                  0
32                      1                     8                  4
   academic_parents km_home_to_zef years_of_study days_to_email_response
1                 N           1.70             20                      1
2                 Y          40.00              9                      1
3                 N       10370.00              7                      1
4                 Y          15.00              3                      1
5                 N           6.00              7                      1
6                 N           8.30             10                      2
7                 N           9.00              6                      2
8                 N          65.00              7                      2
9                 Y           1.00              6                      3
10                N           3.00             20                      3
11                N           4.30             18                      1
12                Y           7.90             18                      1
13                N           0.13             18                      1
14                N           4.10             18                      1
15                N           4.00             17                      1
16                N           4.00             17                      1
17                Y         104.00             17                      1
18                Y          23.80             12                      1
19                Y           8.20             12                      1
20                N           4.00             12                      3
21                N           1.10             12                      3
22                Y       10311.00             12                      4
23                Y           8.00             12                      4
24                N           3.60             12                      4
25                N           4.80             12                      4
26                Y       10300.00             17                      2
27                Y           3.00             10                      1
28                Y        6700.00             20                      1
29                N           2.10             19                      1
30                N           2.50             19                      2
31                N           4.00             18                      1
32                N           6.00             20                      1
   letters_in_first_name labor_mean
1                      4    60.5000
2                      6    60.5000
3                      7    52.9375
4                      7   121.0000
5                      6    90.7500
6                      6   121.0000
7                      5    22.6875
8                      7    60.5000
9                      5    68.0625
10                     4    60.5000
11                     5    75.6250
12                     8    52.9375
13                     8    60.5000
14                     6    60.5000
15                     5    52.9375
16                     5    45.3750
17                     6    60.5000
18                     5    30.2500
19                     7    60.5000
20                     5    60.5000
21                     8    45.3750
22                     7    45.3750
23                     4    37.8125
24                     6    22.6875
25                     6    45.3750
26                     7    45.3750
27                     5    22.6875
28                     5    60.5000
29                     4    60.5000
30                     5    45.3750
31                     5    60.5000
32                     5    60.5000
```

<div class="footer"></small><small>https://dplyr.tidyverse.org/ </small> </small></div>

Wrangling: dplyr::mutate (again)
========================================================
incremental: true
<small> __Mutate__ </small> <img src="Data_Wrangling-figure/dplyr.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";">

Create a commute category


```r
mutate(participants_data, 
       commute = 
         ifelse(km_home_to_zef > 10, 
                 "commuter", "local"))
```

```
   batch age gender continent_of_origin research_continent
1   2017  33      F              Europe             Europe
2   2017  31      F       South America      South America
3   2017  30      F       South America      South America
4   2017  28      M              Africa             Africa
5   2017  30      M              Africa             Africa
6   2017  30      M              Africa             Africa
7   2017  33      F              Africa             Africa
8   2017  30      F       South America      South America
9   2017  27      M              Europe             Europe
10  2018  32      F               China              China
11  2018  32      F                Asia               Asia
12  2018  36      M              Africa             Africa
13  2018  43      F       North America      North America
14  2018  32      M                Asia               Asia
15  2018  28      M                Asia               Asia
16  2018  28      F                Asia               Asia
17  2019  33      M                Asia               Asia
18  2019  31      F                Asia               Asia
19  2019  34      M              Africa             Africa
20  2019  29      M       South America             Africa
21  2019  31      F       South America      South America
22  2019  37      M                Asia               Asia
23  2019  34      M                Asia               Asia
24  2019  23      F                Asia             Africa
25  2019  35      M       South America      South America
26  2017  37      M                Asia               Asia
27  2019  29      F                Asia               Asia
28  2012  32      F                Asia               Asia
29  2019  27      F       South America      South America
30  2019  36      F                Asia               Asia
31  2019  29      M       South America             Africa
32  2019  32      M              Africa             Africa
   number_of_publications working_hours_per_day number_of_siblings
1                       6                     8                  1
2                       0                     8                  2
3                       1                     7                  2
4                       1                    16                  1
5                       3                    12                  5
6                       3                    16                  4
7                       0                     3                  7
8                       2                     8                  1
9                       0                     9                  2
10                      2                     8                  3
11                      2                    10                  2
12                     10                     7                  6
13                      2                     8                  5
14                      2                     8                  6
15                      0                     7                  5
16                      0                     6                  2
17                      2                     8                  3
18                      2                     4                  3
19                      2                     8                  2
20                      2                     8                  0
21                      3                     6                  2
22                      3                     6                  3
23                      6                     5                  2
24                      0                     3                  1
25                     10                     6                  2
26                      3                     6                  3
27                      2                     3                  2
28                     10                     8                  1
29                      2                     8                  1
30                      3                     6                  4
31                      2                     8                  0
32                      1                     8                  4
   academic_parents km_home_to_zef years_of_study days_to_email_response
1                 N           1.70             20                      1
2                 Y          40.00              9                      1
3                 N       10370.00              7                      1
4                 Y          15.00              3                      1
5                 N           6.00              7                      1
6                 N           8.30             10                      2
7                 N           9.00              6                      2
8                 N          65.00              7                      2
9                 Y           1.00              6                      3
10                N           3.00             20                      3
11                N           4.30             18                      1
12                Y           7.90             18                      1
13                N           0.13             18                      1
14                N           4.10             18                      1
15                N           4.00             17                      1
16                N           4.00             17                      1
17                Y         104.00             17                      1
18                Y          23.80             12                      1
19                Y           8.20             12                      1
20                N           4.00             12                      3
21                N           1.10             12                      3
22                Y       10311.00             12                      4
23                Y           8.00             12                      4
24                N           3.60             12                      4
25                N           4.80             12                      4
26                Y       10300.00             17                      2
27                Y           3.00             10                      1
28                Y        6700.00             20                      1
29                N           2.10             19                      1
30                N           2.50             19                      2
31                N           4.00             18                      1
32                N           6.00             20                      1
   letters_in_first_name  commute
1                      4    local
2                      6 commuter
3                      7 commuter
4                      7 commuter
5                      6    local
6                      6    local
7                      5    local
8                      7 commuter
9                      5    local
10                     4    local
11                     5    local
12                     8    local
13                     8    local
14                     6    local
15                     5    local
16                     5    local
17                     6 commuter
18                     5 commuter
19                     7    local
20                     5    local
21                     8    local
22                     7 commuter
23                     4    local
24                     6    local
25                     6    local
26                     7 commuter
27                     5    local
28                     5 commuter
29                     4    local
30                     5    local
31                     5    local
32                     5    local
```

<div class="footer"></small><small>https://dplyr.tidyverse.org/ </small> </small></div>

Wrangling: dplyr::summarize
========================================================
incremental: true
<small> __Summarize__ </small> <img src="Data_Wrangling-figure/dplyr.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";">

Get a summary of selected variables with `summarize`


```r
summarize(participants_data,
          mean(years_of_study),
          median(letters_in_first_name))
```

```
  mean(years_of_study) median(letters_in_first_name)
1             13.65625                           5.5
```


Wrangling: magrittr use
========================================================
incremental: true

__Pipeline %>%__ 

- Mix all the previous with a pipeline `%>%` and use the `group_by` function to get summaries per category


```r
participants_data %>% 
  group_by(research_continent) %>% 
  summarize(mean(days_to_email_response), 
            median(letters_in_first_name), 
            max(years_of_study))
```

```
# A tibble: 6 x 4
  research_contine… `mean(days_to_email_… `median(letters_in_… `max(years_of_st…
  <chr>                             <dbl>                <dbl>             <int>
1 Africa                             1.7                   6                  20
2 Asia                               1.67                  5                  20
3 China                              3                     4                  20
4 Europe                             2                     4.5                20
5 North America                      1                     8                  18
6 South America                      2                     6.5                19
```


purrr: Apply a function to each element of a vector
========================================================
incremental: true
![](Data_Wrangling-figure/purrr.jpg)


```r
library(purrr)
```

purr Cheatsheet https://github.com/rstudio/cheatsheets/blob/master/purrr.pdf

Using purrr
========================================================

![](Data_Wrangling-figure/purrr.jpg)

Use purrr to solve: split a data frame into pieces, fit a model to each piece, compute the summary, then extract the R^2.

https://purrr.tidyverse.org/

http://varianceexplained.org/r/teach-tidyverse/

Using purrr for regression
========================================================

Use purrr 


```r
library(purrr)

    participants_data %>%
      split(.$gender) %>% 
        map(~ 
          lm(number_of_publications ~ 
                number_of_siblings, 
                 data = .)) %>%
  map(summary) %>%
  map_dbl("r.squared")
```

```
         F          M 
0.09973243 0.02634940 
```


Tasks to test your new skills
========================================================
left: 20%
incremental: true

<img src="Data_Wrangling-figure/tidyR.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="35%" style="display: block; margin: auto;" /><img src="Data_Wrangling-figure/dplyr.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="35%" style="display: block; margin: auto;" /><img src="Data_Wrangling-figure/magrittr.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="35%" style="display: block; margin: auto;" />

***
Work through tasks on the `diamonds` data in long format in base and short format with magrittr pipeline:

- select: carat and price
- filter: only where carat is > 0.5
- rename: rename price as cost
- mutate: name expensive or cheap if greater than mean of price/cost
- group_by: split into cheap and expensive
- summarize: give summary statistics

<div class="footer" style="margin-top;font-size:60%;"> 
cory.whitney@uni-bonn.de </div>

