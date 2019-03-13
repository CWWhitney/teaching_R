<style>
.section .reveal .state-background {
    background: white;}
.section .reveal h1,
.section .reveal p {
    color: black;
    position: relative;
    top: 4%;}
    </style>
    
Data Visualization
========================================================
author: Cory Whitney
font-family: 'Helvetica'
date: "2019-03-13"
autosize: true
css: mySlideTemplate.css
incremental: true

<img src="Data_Visualization-figure/Circos.png" style="background:none; border:none; box-shadow:none;height="200"; width="200";"><img src="Data_Visualization-figure/INRES_Logo.png" style="background:none; border:none; box-shadow:none;height="100"; width="100";"><img src="Data_Visualization-figure/Uni_Bonn_Picture.png" style="background:none; border:none; box-shadow:none;height="200"; width="200";"><img src="Data_Visualization-figure/ZEF_Logo.png" style="background:none; border:none; box-shadow:none;height="200"; width="200";">

<div class="footer"></small>cory.whitney@uni-bonn.de </small></div>


Data visualization: getting stuck
========================================================
incremental: true
right: 30%

- open RStudio
<img src="Data_Visualization-figure/rstudio-hex.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="30%" style="display: block; margin: auto 0 auto auto;" />

- **Help > Cheatsheets > Data Visualization with ggplot2**

- type ‘?’ in R console with function, package or data name
- Add “R” to a search with a copy of an error message
- Many talented programmers who scan the web and answer issues

<img src="Data_Visualization-figure/stack-overflow.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" width="50%" style="display: block; margin: auto;" />
</small>https://stackoverflow.com/ </small>

***
<img src="Data_Visualization-figure/hadley_wickham.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" width="50%" style="display: block; margin: auto;" />
Hadley Wickham
<img src="Data_Visualization-figure/Yihui.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" width="50%" style="display: block; margin: auto;" />
Yihui Xie

<small>https://yihui.name/en/2017/08/so-gh-email/</small>

<small>https://rmarkdown.rstudio.com/ </small>

Creating basic plots
========================================================
incremental: true

**R has several systems for making graphs**

- **Base R** 


```r
participants_data <- read.csv("participants_data.csv")
plot(participants_data$academic_parents)
```

![plot of chunk unnamed-chunk-5](Data_Visualization-figure/unnamed-chunk-5-1.png)
<small>Bar plot of number of observations of binary data related to academic parents </small>

***


```r
plot(participants_data$academic_parents, participants_data$days_to_email_response)
```

![plot of chunk unnamed-chunk-6](Data_Visualization-figure/unnamed-chunk-6-1.png)
<small>Boxplot of days to email response grouped by binary data related to academic parents</small>

**Use help functions**

```r
?plot
```

ggplot2: overview
========================================================
incremental: true
right: 30%

**R has several systems for making graphs**

- **ggplot2** is one of the most elegant and most versatile.
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="30%" style="display: block; margin: auto 0 auto auto;" />

- it implements the *grammar of graphics* to describe and build graphs. 

- Do more faster by learning one system and applying it in many places.

- Learn more about ggplot2 in “The Layered Grammar of Graphics”

<http://vita.had.co.nz/papers/layered-grammar.pdf>

ggplot2: qplot with participant data
========================================================
incremental: true


```r
library(ggplot2)
qplot(days_to_email_response, letters_in_first_name, data = participants_data)
```

<img src="Data_Visualization-figure/unnamed-chunk-9-1.png" title="plot of chunk unnamed-chunk-9" alt="plot of chunk unnamed-chunk-9" style="display: block; margin: auto;" />
<small>Scatterplot of days to email response as a function of the letters in your first name</small>

<small>Want to understand how all the pieces fit together? See the R
for Data Science book: http://r4ds.had.co.nz/</small>

ggplot2: qplot with built-in data
========================================================
incremental: true
right: 30%

Example from built-in R data on iris


```r
qplot(Sepal.Length, Petal.Length, data=iris, color=Species, size=Petal.Width)
```

<img src="Data_Visualization-figure/unnamed-chunk-10-1.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" style="display: block; margin: auto;" />
<small> Scatterplot of iris petal length as a function of sepal length with colors representing iris species and petal width as bubble sizes.</small>



```r
?iris
```





Bonus: gganimate
========================================================


```r
library(ggplot2)
library(gganimate)
library(gifski)
         ggplot(mtcars, aes(factor(cyl), mpg)) + 
  geom_boxplot() + 
  geom_point() +
  transition_states(am, transition_length = 4, state_length = 1) + 
  view_follow()
```

<img src="Data_Visualization-figure/unnamed-chunk-12-1.gif" title="plot of chunk unnamed-chunk-12" alt="plot of chunk unnamed-chunk-12" style="display: block; margin: auto;" />

Tasks for the afternoon: Basic
========================================================
incremental: true
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" width="35%" style="display: block; margin: auto;" />

- Check your data for interesting trends and correlations
- Use scatter plots, barcharts and boxplots
- Bootstrap and vary the sample and run the same analysis and plots
- Save your most interesting figure and share it with us the next day

Tasks for the afternoon: Advanced
========================================================
incremental: true

<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-14" alt="plot of chunk unnamed-chunk-14" width="35%" style="display: block; margin: auto;" />

- Import data from an external source (e.g. FAO, World Bank)
- Display those data in an interactive plot
- Play around with the design
- Export your most interesting figure and share it with us tomorrow

Be prepared for tomorrow
========================================================
incremental: true

Install Git & Github (if you do not already have them). 

Git
<small>https://git-scm.com/downloads</small>

Github
<small>http://r-pkgs.had.co.nz/git.html</small>

join Github
<small>https://github.com/</small>

