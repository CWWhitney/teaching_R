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

- **Open RStudio**
![](Data_Visualization-figure/rstudio-hex.png)

- type ‘?’ in R console with function, package or data name
- Add “R” to a search with a copy of an error message

- **Help > Cheatsheets > Data Visualization with ggplot2**

Data visualization: getting help
========================================================
incremental: true
right: 30%

![](Data_Visualization-figure/rstudio-hex.png)

- Many talented programmers 
- Some scan the web and answer issues

<img src="Data_Visualization-figure/stack-overflow.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="20%" style="display: block; margin: auto;" />
</small>https://stackoverflow.com/ </small>

***

<img src="Data_Visualization-figure/hadley_wickham.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" width="50%" style="display: block; margin: auto;" />
Hadley Wickham
<img src="Data_Visualization-figure/Yihui.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" width="50%" style="display: block; margin: auto;" />
Yihui Xie

<small>https://yihui.name/en/2017/08/so-gh-email/</small>

<small>https://rmarkdown.rstudio.com/ </small>

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
- Create a barplot with the `plot()` function


```r
plot(participants_data$academic_parents)
```

<img src="Data_Visualization-figure/base_barplot-1.png" title="plot of chunk base_barplot" alt="plot of chunk base_barplot" width="20%" style="display: block; margin: auto;" />
<small>Bar plot of number of observations of binary data related to academic parents</small>

Creating a boxplot in base R
========================================================
incremental: true

- Create a boxplot with the same `plot()` function


```r
plot(participants_data$academic_parents, participants_data$days_to_email_response)
```

<img src="Data_Visualization-figure/base_boxplot-1.png" title="plot of chunk base_boxplot" alt="plot of chunk base_boxplot" width="20%" style="display: block; margin: auto;" />
<small>Boxplot of days to email response grouped by binary data related to academic parents</small>

ggplot2: overview
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
ggplot(data = participants_data, aes(x=letters_in_first_name, y=days_to_email_response)) + 
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
ggplot(data = participants_data, aes(x=letters_in_first_name, y=days_to_email_response, color=academic_parents, size=working_hours_per_day)) + 
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
ggplot(data=iris, aes(x=Sepal.Length, y=Petal.Length, color=Species, size=Petal.Width))+ 
  geom_point()
```

<img src="Data_Visualization-figure/ggplot_iris-1.png" title="plot of chunk ggplot_iris" alt="plot of chunk ggplot_iris" style="display: block; margin: auto;" />
<small>Scatterplot of iris petal length as a function of sepal length with colors representing iris species and petal width as bubble sizes.</small>

ggplot2: diamonds price
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" width="70%" style="display: block; margin: auto 0 auto auto;" />

***

**ggplot** accepts formula arguments such as log
```
ggplot(data = diamonds, aes(x=carat, y=price, alpha = 0.2)) + geom_point()
```
```
ggplot(data = diamonds, aes(x=log(carat), y= log(price), alpha = 0.2)) + geom_point()
```
<img src="Data_Visualization-figure/ggplot_carat_price-1.png" title="plot of chunk ggplot_carat_price" alt="plot of chunk ggplot_carat_price" style="display: block; margin: auto;" />

ggplot2: diamonds color shape
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***


```r
library(dplyr)
dsmall <- top_n(diamonds, n=100)
#Plot with different colors for color
ggplot(data = dsmall, aes(x=carat, y=price, color = color))+ geom_point()
```

```r
#Plot with different shapes for cut 
ggplot( data = dsmall, aes(carat, price, shape = cut)) + geom_point()
```

<img src="Data_Visualization-figure/ggplot_diamonds_color_shape-1.png" title="plot of chunk ggplot_diamonds_color_shape" alt="plot of chunk ggplot_diamonds_color_shape" style="display: block; margin: auto;" />


ggplot2: set parameters
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

Set parameters manually with `I()` *Inhibit Interpretation / Conversion of Objects*

```r
ggplot(data = diamonds, aes(carat, price, alpha=I(0.1), color=I("blue"))) + geom_point()
```

```r
ggplot(data = diamonds, aes(carat, price, alpha=I(0.4), color=I("green"))) + geom_point()
```

<img src="Data_Visualization-figure/ggplot_set-1.png" title="plot of chunk ggplot_set" alt="plot of chunk ggplot_set" style="display: block; margin: auto;" />


ggplot2: geom options
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

With “geom” different types of plots can be defined e.g. points, line, boxplot, path, smooth. These can also be combined.
```
ggplot(data=dsmall, aes(x=carat, y=price))+
geom_point()+
geom_smooth()
```
<img src="Data_Visualization-figure/ggplot_geom-1.png" title="plot of chunk ggplot_geom" alt="plot of chunk ggplot_geom" style="display: block; margin: auto;" />


ggplot2: smooth function
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" width="70%" style="display: block; margin: auto;" />

***

`geom_smooth()` selects a smoothing method based on the data. Use `method =` to specify your preferred smoothing method.
```
ggplot(data=dsmall, aes(x=carat, y=price))+ geom_point()+ geom_smooth()

ggplot(data=diamonds, aes(x=carat, y=price))+ geom_point()+ 
geom_smooth(method = 'glm')
```

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
ggplot(data=diamonds, aes(x=color, y=price/carat)) + 
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
ggplot(data=diamonds, aes(x=color, y=price/carat)) + 
geom_boxplot()+ 
geom_jitter()
```

<img src="Data_Visualization-figure/jitter_plot-1.png" title="plot of chunk jitter_plot" alt="plot of chunk jitter_plot" style="display: block; margin: auto;" />

ggplot2: adding alpha 
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

In case of overplotting changing `alpha` can help.

```r
ggplot(data=diamonds, aes(x=color, y=price/carat, alpha=I(0.1))) + 
geom_boxplot()+ 
geom_jitter()
```

<img src="Data_Visualization-figure/boxplot_jitter-1.png" title="plot of chunk boxplot_jitter" alt="plot of chunk boxplot_jitter" style="display: block; margin: auto;" />

<img src="Data_Visualization-figure/ggplot_box_jitter-1.png" title="plot of chunk ggplot_box_jitter" alt="plot of chunk ggplot_box_jitter" style="display: block; margin: auto;" />


ggplot2: geom_histogram
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

```
ggplot(data = diamonds, aes(x=carat)) +
geom_density()

ggplot(data = diamonds, aes(x=carat, color = color)) +
geom_density()

ggplot(data = diamonds, aes(x=carat, color = color, alpha=I(0.3))) +
geom_density()
```

<img src="Data_Visualization-figure/ggplot_histograms-1.png" title="plot of chunk ggplot_histograms" alt="plot of chunk ggplot_histograms" style="display: block; margin: auto;" />
~~ggplot2 histograms~~

ggplot2: subset
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

Use factor to subset your data.
```
ggplot(data = mpg, aes(x=displ, y=hwy,  color = cyl))+ 
geom_point()+
geom_smooth(method="lm")

ggplot(data = mpg, aes(x=displ, y=hwy,  color = factor(cyl)))+ 
geom_point()+
geom_smooth(method="lm")
```

<img src="Data_Visualization-figure/ggplot_subset-1.png" title="plot of chunk ggplot_subset" alt="plot of chunk ggplot_subset" style="display: block; margin: auto;" />
~~ggplot2 subset with smooth line~~

ggplot2: "slow ggplotting"
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/r_ladies.jpg)

for `aes()` in `ggplot()`
***

- using fewer functions; example - using labs() to add a title instead of ggtitle()
- using functions multiple times; example aes(x = var1) + aes(y = var2) rather than aes(x = var1, y = var2)
- using base R functions and tidyverse functions.  For other packages, the :: style to call them
- write out arguments (no shortcuts)  aes(x = gdppercap) not aes(gdppercap)

<small><https://evamaerey.github.io/ggplot_flipbook/ggplot_flipbook_xaringan.html#1></small>

ggplot2: not slow example
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/r_ladies.jpg)

***
ggplot code in non-slow fashion

```r
ggplot(mtcars, aes(mpg, y = hp, col = gear)) +
  geom_point() +
  ggtitle("My Title") +
  labs(x = "the x label", y = "the y label", col = "legend title")
```

<img src="Data_Visualization-figure/ggplot_not_slow-1.png" title="plot of chunk ggplot_not_slow" alt="plot of chunk ggplot_not_slow" style="display: block; margin: auto;" />

ggplot2: slow ggplotting example
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/r_ladies.jpg)

***
'Slow ggplotting' version for the same plot

```r
  ggplot(data = mtcars) +
  aes(x = mpg) +
  labs(x = "the x label") +
  aes(y = hp) +
  labs(y = "the y label") +
  geom_point() +
  aes(col = gear) +
  labs(col = "legend title") +
  labs(title = "My Title")
```

<img src="Data_Visualization-figure/slow_ggplotting_example-1.png" title="plot of chunk slow_ggplotting_example" alt="plot of chunk slow_ggplotting_example" style="display: block; margin: auto;" />

<small><https://evamaerey.github.io/ggplot_flipbook/ggplot_flipbook_xaringan.html#1></small>

ggplot2: geom_tile
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="80%" style="display: block; margin: auto 0 auto auto;" />

***

- Use `dplyr`, `ggplot2` and `reshape2` 

```
part_data<-select_if(participants_data, is.numeric)

cormat <- round(cor(part_data), 1)
melted_cormat <- melt(cormat)

ggplot(data = melted_cormat, aes(x=Var1, 
y=Var2, fill=value)) + 
geom_tile()
```

<img src="Data_Visualization-figure/geom_melted_cormat-1.png" title="plot of chunk geom_melted_cormat" alt="plot of chunk geom_melted_cormat" style="display: block; margin: auto;" />

Export Figures
========================================================
incremental: true
right: 70%
<img src="Data_Visualization-figure/cortile.png" title="plot of chunk unnamed-chunk-9" alt="plot of chunk unnamed-chunk-9" style="display: block; margin: auto;" />

***

```
png(file = "cortile.png", width = 7, height = 6, units = "in", res = 300)

ggplot(data = melted_cormat, aes(x = Var1, y = Var2, fill = value)) + geom_tile() + theme(axis.text.x = element_text(angle = 45, hjust = 1))

dev.off()
```

- Check with journal about size, resolution etc.


```r
?pdf
```


gganimate: datasauRus
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/gganimate_logo.png" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" width="80%" style="display: block; margin: auto 0 auto auto;" />

***

- Use `datasauRus`, `ggplot2` and `gganimate` 

```
library(gganimate)
library(datasauRus)
```
```
ggplot(datasaurus_dozen, aes(x=x, y=y))+
  geom_point()+
  theme_minimal() +
  transition_states(dataset, 3, 1) + 
  ease_aes('cubic-in-out')
```

gganimate: Datasaurus Dozen
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/gganimate_logo.png" title="plot of chunk unnamed-chunk-12" alt="plot of chunk unnamed-chunk-12" width="80%" style="display: block; margin: auto 0 auto auto;" />

***

<img src="Data_Visualization-figure/animate_datasaurus_dozen-1.gif" title="plot of chunk animate_datasaurus_dozen" alt="plot of chunk animate_datasaurus_dozen" style="display: block; margin: auto;" />
  
gganimate: diamonds carat
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/gganimate_logo.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" width="80%" style="display: block; margin: auto 0 auto auto;" />

***

- Use `tidyverse`, `ggplot2` and `gganimate`


```r
ggplot(data = dsmall, aes(x = carat, y = price, color = color)) + 
  geom_line() +
  transition_reveal(carat) + 
  ease_aes("linear") +
  labs(title='Diamond carat: {frame_along}')
```

<img src="Data_Visualization-figure/animate_diamonds-1.gif" title="plot of chunk animate_diamonds" alt="plot of chunk animate_diamonds" style="display: block; margin: auto;" />


Tasks for the afternoon: Basic
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-14" alt="plot of chunk unnamed-chunk-14" width="80%" style="display: block; margin: auto;" />

***

**Test your new skills**

- Use scatter plots, barcharts and boxplots
- Vary the sample and run the same analysis and plots
- Save your most interesting figure and share it with us tomorrow

Tasks for the afternoon: Advanced
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-15" alt="plot of chunk unnamed-chunk-15" width="80%" style="display: block; margin: auto;" />

***

**Your turn to perform**

- Import data from an external source (e.g. FAO, World Bank)
- Display those data in an interactive plot
- Play around with the design
- Export your most interesting figure and share it with us
