<style>
.section .reveal .state-background {
    background: white;}
.section .reveal h1,
.section .reveal p {
    color: black;
    position: relative;
    top: 4%;}
    </style>
    
<!-- enable caching globally for the presentation with this code chunk: If you run into problems with cached output you can always use the Clear Knitr Cache command on the More menu to rebuild your presentation without previously cached output. -->
    


Data Visualization
========================================================
author: Cory Whitney
font-family: 'Helvetica'
autosize: true
css: mySlideTemplate.css
incremental: true

<img src="Data_Visualization-figure/Circos.png" style="background:none; border:none; box-shadow:none;height="200"; width="200";"><img src="Data_Visualization-figure/INRES_Logo.png" style="background:none; border:none; box-shadow:none;height="100"; width="100";"><img src="Data_Visualization-figure/Uni_Bonn_Picture.png" style="background:none; border:none; box-shadow:none;height="200"; width="200";"><img src="Data_Visualization-figure/ZEF_Logo.png" style="background:none; border:none; box-shadow:none;height="200"; width="200";">

<div class="footer"></small>cory.whitney@uni-bonn.de </small></div>

Data visualization: getting stuck
========================================================
incremental: true
![](Data_Visualization-figure/rstudio-hex.png)
- **Open RStudio**

- type `?` in R console with function, package or data name
- Add `R` to a search with a copy of an error message

- **Help > Cheatsheets > Data Visualization with ggplot2**

Data visualization: getting help
========================================================
incremental: true
right: 30%

![](Data_Visualization-figure/rstudio-hex.png)

- Many talented programmers 
- Some scan the web and answer issues

![](Data_Visualization-figure/stack-overflow.png)

</small>https://stackoverflow.com/ </small>

***

![](Data_Visualization-figure/hadley_wickham.png)
Hadley Wickham

![](Data_Visualization-figure/Yihui.png)
Yihui Xie
<small>https://yihui.name/en/2017/08/so-gh-email/</small>

Getting your data in R
========================================================
incremental: true
<small>Load data</small> <img src="Data_Visualization-figure/R_logo.png" style="background:none; border:none; box-shadow:none;height="10%"; width="10%";">

- Load the data

```r
participants_data <- read.csv("participants_data.csv")
```
- Keep your data in the same folder structure as .RProj
- at or below the level of .RProj

Creating a barplot in base R
========================================================
incremental: true

**R has several systems for making graphs**

- **Base R** 
- Create a barplot with the `table()` and `barplot()` functions


```r
participants_barplot <- table(participants_data$academic_parents)

barplot(participants_barplot)
```

<img src="Data_Visualization-figure/base_barplot-1.png" title="plot of chunk base_barplot" alt="plot of chunk base_barplot" width="20%" style="display: block; margin: auto;" />
<small>Bar plot of number of observations of binary data related to academic parents</small>

ggplot2: 'Grammar of Graphics' Overview
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)

***

**Many libraries and functions for graphs in R...**

- **ggplot2** is one of the most elegant and most versatile.

- **ggplot** implements the *grammar of graphics* to describe and build graphs. 

- Do more and do it faster by learning one system and applying it in many places.

- Learn more about ggplot2 in “The Layered Grammar of Graphics”

<http://vita.had.co.nz/papers/layered-grammar.pdf>


ggplot2: names and email
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)

***

**Example from your data**


```r
library(ggplot2)
ggplot(data = participants_data, 
       aes(x = letters_in_first_name, 
           y = days_to_email_response)) + 
  geom_point()
```

<img src="Data_Visualization-figure/ggplot_name_email-1.png" title="plot of chunk ggplot_name_email" alt="plot of chunk ggplot_name_email" style="display: block; margin: auto;" />
<small>Scatterplot of days to email response as a function of the letters in your first name</small>

<small>Want to understand how all the pieces fit together? See the R
for Data Science book: http://r4ds.had.co.nz/</small>

ggplot2: add color and size
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)

***


```r
ggplot(data = participants_data, 
       aes(x = letters_in_first_name, 
           y = days_to_email_response, 
           color = academic_parents, 
           size = working_hours_per_day)) + 
  geom_point()
```

<img src="Data_Visualization-figure/ggplot_color_size-1.png" title="plot of chunk ggplot_color_size" alt="plot of chunk ggplot_color_size" style="display: block; margin: auto;" />
<small>Scatterplot of letters in your first name as a function of days to email response with colors representing binary data related to academic parents and working hours per day as bubble sizes.</small>

**Make more graphs**

ggplot2: iris data
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

**Example from Anderson's iris data set**


```r
ggplot(data = iris, 
       aes(x = Sepal.Length, 
           y = Petal.Length, 
           color = Species, 
           size = Petal.Width))+ 
  geom_point()
```

<img src="Data_Visualization-figure/ggplot_iris-1.png" title="plot of chunk ggplot_iris" alt="plot of chunk ggplot_iris" style="display: block; margin: auto;" />
<small>Scatterplot of iris petal length as a function of sepal length with colors representing iris species and petal width as bubble sizes.</small>

ggplot2: diamonds price
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)

***

**ggplot** accepts formula arguments such as log


```r
ggplot(data = diamonds,
       aes(x = log(carat),
           y = log(price),
           alpha = 0.2)) + 
  geom_point()
```

<img src="Data_Visualization-figure/ggplot_carat_price-1.png" title="plot of chunk ggplot_carat_price" alt="plot of chunk ggplot_carat_price" style="display: block; margin: auto;" />

ggplot2: diamonds color shape
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

<img src="Data_Visualization-figure/diamonds_color-1.png" title="plot of chunk diamonds_color" alt="plot of chunk diamonds_color" style="display: block; margin: auto;" />


ggplot2: set parameters
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

Set parameters manually with `I()` *Inhibit Interpretation / Conversion of Objects*
<img src="Data_Visualization-figure/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />


ggplot2: geom options
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

With “geom” different types of plots can be defined e.g. points, line, boxplot, path, smooth. These can also be combined.

<img src="Data_Visualization-figure/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />


ggplot2: smooth function
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)

***

`geom_smooth()` selects a smoothing method based on the data. Use `method =` to specify your preferred smoothing method.

<img src="Data_Visualization-figure/ggplot_smooth-1.png" title="plot of chunk ggplot_smooth" alt="plot of chunk ggplot_smooth" style="display: block; margin: auto;" />
~~ggplot2 lines and smoothing options~~


ggplot2: boxplots 
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

- Boxplots can be displayed through `geom_boxplot()`. 


```r
# Create a boxplot where the x-axis is cut and
#  the y-axis is price divided by carat
ggplot(data = diamonds, 
       aes(x = cut, 
           y = price/carat)) + 
geom_boxplot()
```

<img src="Data_Visualization-figure/ggplot_boxplot-1.png" title="plot of chunk ggplot_boxplot" alt="plot of chunk ggplot_boxplot" style="display: block; margin: auto;" />

ggplot2: jitter points 
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

- Jittered plots `geom_jitter()` show all points. 


```r
# Create a jittered boxplot where the x-axis is cut and
#  the y-axis is price divided by carat
ggplot(data = diamonds, 
       aes(x = color, 
           y = price/carat)) + 
geom_boxplot()+ 
geom_jitter()
```

<img src="Data_Visualization-figure/jitter_plot-1.png" title="plot of chunk jitter_plot" alt="plot of chunk jitter_plot" style="display: block; margin: auto;" />

<!-- "many more examples in the tutorial" -->

Your turn to perform
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)

***

After you have gone through the tutorial please do the following exercises.

- Create a scatter plot, barchart and boxplot (as above)
- Vary the sample and run the same analysis and plots
- Save your most interesting figure and share it with us
