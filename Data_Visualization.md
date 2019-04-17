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
date: "2019-04-17"
width: 1920
height: 1080
css: mySlideTemplate.css
incremental: true

<img src="Data_Visualization-figure/Circos.png" style="background:none; border:none; box-shadow:none;height="200"; width="200";"><img src="Data_Visualization-figure/INRES_Logo.png" style="background:none; border:none; box-shadow:none;height="100"; width="100";"><img src="Data_Visualization-figure/Uni_Bonn_Picture.png" style="background:none; border:none; box-shadow:none;height="200"; width="200";"><img src="Data_Visualization-figure/ZEF_Logo.png" style="background:none; border:none; box-shadow:none;height="200"; width="200";">

<div class="footer"></small>cory.whitney@uni-bonn.de </small></div>

Data visualization: getting stuck
========================================================
incremental: true
right: 30%

- **Open RStudio**
![](Data_Visualization-figure/rstudio-hex.png)

- **Help > Cheatsheets > Data Visualization with ggplot2**

- type ‘?’ in R console with function, package or data name
- Add “R” to a search with a copy of an error message
- Many talented programmers who scan the web and answer issues

<img src="Data_Visualization-figure/stack-overflow.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="20%" style="display: block; margin: auto;" />
</small>https://stackoverflow.com/ </small>

***
<img src="Data_Visualization-figure/hadley_wickham.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" width="50%" style="display: block; margin: auto;" />
Hadley Wickham
<img src="Data_Visualization-figure/Yihui.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" width="50%" style="display: block; margin: auto;" />
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

<img src="Data_Visualization-figure/base_barplot-1.png" title="plot of chunk base_barplot" alt="plot of chunk base_barplot" width="50%" style="display: block; margin: auto;" />
<small>Bar plot of number of observations of binary data related to academic parents </small>

***


```r
plot(participants_data$academic_parents, participants_data$days_to_email_response)
```

<img src="Data_Visualization-figure/base_boxplot-1.png" title="plot of chunk base_boxplot" alt="plot of chunk base_boxplot" width="50%" style="display: block; margin: auto;" />
<small>Boxplot of days to email response grouped by binary data related to academic parents</small>

**Use help '?' for function**

```r
?plot
```

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

<img src="Data_Visualization-figure/layered_grammer.jpg" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" width="80%" style="display: block; margin: auto 0 auto auto;" />

ggplot2: qplot with participant data
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)

**qplot: 'poor man's ggplot?**
***


```r
library(ggplot2)

qplot(days_to_email_response, letters_in_first_name, data = participants_data)
```

<img src="Data_Visualization-figure/qplot_partdata-1.png" title="plot of chunk qplot_partdata" alt="plot of chunk qplot_partdata" height="30%" style="display: block; margin: auto;" />
<small>Scatterplot of days to email response as a function of the letters in your first name</small>

**Use help '?' for function**

```r
?qplot
```

<small>Want to understand how all the pieces fit together? See the R
for Data Science book: http://r4ds.had.co.nz/</small>

ggplot2: qplot with your data
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)

***

**Example from your data**


```r
qplot(days_to_email_response, letters_in_first_name, color=academic_parents, size=working_hours_per_day, data=participants_data)
```

<img src="Data_Visualization-figure/qplot_yourdata-1.png" title="plot of chunk qplot_yourdata" alt="plot of chunk qplot_yourdata" style="display: block; margin: auto;" />
<small>Scatterplot of letters in your first name as a function of days to email response with colors representing binary data related to academic parents and working hours per day as bubble sizes.</small>

**Make more graphs**

ggplot2: qplot with iris data
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

**Example from Anderson's iris data set**


```r
qplot(Sepal.Length, Petal.Length, data=iris, color=Species, size=Petal.Width)
```

<img src="Data_Visualization-figure/qplot_iris-1.png" title="plot of chunk qplot_iris" alt="plot of chunk qplot_iris" style="display: block; margin: auto;" />
<small>Scatterplot of iris petal length as a function of sepal length with colors representing iris species and petal width as bubble sizes.</small>

**Use help '?' for data**

```r
?iris
```


ggplot2: qplot with diamonds price
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="70%" style="display: block; margin: auto 0 auto auto;" />

***

**qplot** accepts formula arguments such as log
```
qplot(carat, price, data = diamonds)
```
```
qplot(log(carat), log(price), data = diamonds)
```
<img src="Data_Visualization-figure/qplot_carat-1.png" title="plot of chunk qplot_carat" alt="plot of chunk qplot_carat" style="display: block; margin: auto;" />

**Use help '?' for data**

```r
?diamonds
```


ggplot2: qplot diamonds color shape
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

```
#Create a sample

dsmall <- diamonds[sample(nrow(diamonds), 100), ]

#Plot with different colours for color
qplot(carat, price, data = dsmall, colour = color)

#Plot with different shapes for cut 
qplot(carat, price, data = dsmall, shape = cut)
```
<img src="Data_Visualization-figure/qplot_diamonds_color_shape-1.png" title="plot of chunk qplot_diamonds_color_shape" alt="plot of chunk qplot_diamonds_color_shape" style="display: block; margin: auto;" />
~~Different colors and shapes~~

**Use help '?' for function**

```r
?sample
```

```
Help on topic 'sample' was found in the following packages:

  Package               Library
  dplyr                 /Users/macbook/Library/R/3.5/library
  base                  /Library/Frameworks/R.framework/Resources/library


Using the first match ...
```


ggplot2: qplot set parameters
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

Set parameters manually with I()
```
qplot(carat, price, data = diamonds, alpha=I(0.1), colour=I("blue"))
```
```
qplot(carat, price, data = diamonds, alpha=I(0.4), colour=I("green"))
```

<img src="Data_Visualization-figure/qplot_set-1.png" title="plot of chunk qplot_set" alt="plot of chunk qplot_set" style="display: block; margin: auto;" />
~~Inhibit Interpretation / Conversion of Objects~~

**Use help '?' for function**

```r
?I
```

ggplot2: geom
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

With “geom” different types of plots can be defined e.g. points, line, boxplot, path, smooth. 
These can also be combined in a vector.
```
qplot(carat,price,data=dsmall, geom="line")
```
```
qplot(carat,price,data=dsmall, geom="smooth")
```
```
qplot(carat,price,data=dsmall, geom=c("point","smooth"))
```
<img src="Data_Visualization-figure/qplot_geom-1.png" title="plot of chunk qplot_geom" alt="plot of chunk qplot_geom" style="display: block; margin: auto;" />
~~ggplot2 geom options~~

**Use help '?' for function**

```r
?qplot
```
~~read 'Arguments' section of help file~~

ggplot2: smooth function
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" width="70%" style="display: block; margin: auto;" />

***

Depending on your dataset size the smooth function will select different lines and smoothing methods.
```
qplot(carat,price,data=dsmall,geom=c("point","smooth"))
```
```
qplot(carat,price,data=diamonds,geom=c("point","smooth"))
```
With span the wiggliness of the line is controlled.
```
qplot(carat,price,data=dsmall, geom=c("point","smooth"), span=0.2)
```
Use method to specify your smoothing method
```
qplot(carat,price,data=dsmall,geom=c("point","smooth"),method="lm")
```

<img src="Data_Visualization-figure/qplot_smooth-1.png" title="plot of chunk qplot_smooth" alt="plot of chunk qplot_smooth" style="display: block; margin: auto;" />
~~ggplot2 lines and smoothing options~~


ggplot2: Boxplots and jitter
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

- Boxplots can be displayed through geom=“boxplot”. 

```
qplot(color,price/carat,data=diamonds,  geom="boxplot")
```

- Jittered plots (geom=“jitter”) show all points. In case of overplotting changing alpha can help.

```
qplot(color,price/carat,data=diamonds, geom="jitter")
```
```
qplot(color,price/carat,data=diamonds, geom="jitter", alpha=I(0.1))
```

<img src="Data_Visualization-figure/qplot_box_jitter-1.png" title="plot of chunk qplot_box_jitter" alt="plot of chunk qplot_box_jitter" style="display: block; margin: auto;" />
~~ggplot2 boxplots and jitter~~

ggplot2: Histograms
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

Histograms can be displayed through geom=“histogram”.
```
qplot(carat, data = diamonds, geom = "density")
```
```
qplot(carat, data = diamonds, geom = "density", colour = color)
```
```
qplot(carat, data = diamonds, geom = "density", fill = color, alpha=I(0.3))
```

<img src="Data_Visualization-figure/qplot_histograms-1.png" title="plot of chunk qplot_histograms" alt="plot of chunk qplot_histograms" style="display: block; margin: auto;" />
~~ggplot2 histograms~~

ggplot2: subset
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/ggplot2.png)


***

Use factor to subset your data.
```
qplot(displ, hwy, data = mpg, colour = cyl, geom=c("point","smooth"),method="lm")
```
```
qplot(displ, hwy, data = mpg, colour = factor(cyl), geom=c("point","smooth"),method="lm")
```

<img src="Data_Visualization-figure/qplot_subset-1.png" title="plot of chunk qplot_subset" alt="plot of chunk qplot_subset" style="display: block; margin: auto;" />
~~ggplot2 subset with smooth line~~

ggplot2: "slow ggplotting"
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/r_ladies.jpg)


***

- pulling out aes() from the ggplot() function:  
- using fewer functions; example - using labs() to add a title instead of ggtitle()
- using functions multiple times; example aes(x = var1) + aes(y = var2) rather than aes(x = var1, y = var2)
- using base R functions and tidyverse functions.  For other packages, the :: style to call them
- write out arguments (no shortcuts)  aes(x = gdppercap) not aes(gdppercap)
- order ggplot commands so that reactivity is obvious; scale adjustments to aesthetics might also be near the aesthetic declaration.

~~<https://evamaerey.github.io/ggplot_flipbook/ggplot_flipbook_xaringan.html#1>~~

ggplot2: slow ggplotting example
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/r_ladies.jpg)

***
Usual ggplot code
```
ggplot(mtcars, aes(mpg, y = hp, col = gear)) +
  geom_point() +
  ggtitle("My Title") +
  labs(x = "the x label", y = "the y label", col = "legend title")
```
'Slow ggplotting' version for same plot
``` 
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
<img src="Data_Visualization-figure/slow_ggplot-1.png" title="plot of chunk slow_ggplot" alt="plot of chunk slow_ggplot" style="display: block; margin: auto;" />

~~<https://evamaerey.github.io/ggplot_flipbook/ggplot_flipbook_xaringan.html#1>~~

Correlation
========================================================
incremental: true
right: 80%
![](Data_Visualization-figure/spaghetti_monster.png)

***


```r
cor.test(participants_data$days_to_email_response, participants_data$letters_in_first_name)
```

```

	Pearson's product-moment correlation

data:  participants_data$days_to_email_response and participants_data$letters_in_first_name
t = -1.647, df = 13, p-value = 0.1235
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.7649469  0.1229287
sample estimates:
       cor 
-0.4154989 
```

**Use help '?' for function**

```r
?cor.test
```

Bonus: gganimate Datasaurus Dozen
========================================================
incremental: true
<img src="Data_Visualization-figure/gganimate_logo.png" title="plot of chunk unnamed-chunk-15" alt="plot of chunk unnamed-chunk-15" width="20%" style="display: block; margin: auto 0 auto auto;" />

- Using the datasauRus, ggplot2 and gganimate libraries.
- Note the many calls for ggplot

```
ggplot(datasaurus_dozen, aes(x=x, y=y))+
  geom_point()+
  theme_minimal() +
  transition_states(dataset, 3, 1) + 
  ease_aes('cubic-in-out')
```

***

<img src="Data_Visualization-figure/animate_datasaurus_dozen-1.gif" title="plot of chunk animate_datasaurus_dozen" alt="plot of chunk animate_datasaurus_dozen" style="display: block; margin: auto;" />
  
Bonus: gganimate mtcars mpg
========================================================
incremental: true
<img src="Data_Visualization-figure/gganimate_logo.png" title="plot of chunk unnamed-chunk-16" alt="plot of chunk unnamed-chunk-16" width="20%" style="display: block; margin: auto 0 auto auto;" />

- Using the gifski, ggplot2 and gganimate libraries.

```
ggplot(mtcars, aes(factor(cyl), mpg)) + 
  geom_boxplot() + 
  geom_point() +
  transition_states(am, transition_length = 4, state_length = 1) + 
  view_follow()
```

***

<img src="Data_Visualization-figure/animate_mtcars-1.gif" title="plot of chunk animate_mtcars" alt="plot of chunk animate_mtcars" style="display: block; margin: auto;" />

ggplot2: geom_tile
========================================================
incremental: true
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-17" alt="plot of chunk unnamed-chunk-17" width="20%" style="display: block; margin: auto 0 auto auto;" />

- Using the dplyr, ggplot2 and reshape2 libraries.

```
part_data<-select(participants_data, days_to_email_response, number_of_siblings, years_of_study, number_of_publications, letters_in_first_name, km_home_to_zef, working_hours_per_day, days_to_email_response)
```
```
cormat <- round(cor(part_data), 1)
melted_cormat <- melt(cormat)
```
```
ggplot(data = melted_cormat, aes(x=Var1, 
y=Var2, fill=value)) + 
geom_tile()
```

***
<img src="Data_Visualization-figure/geom_melted_cormat-1.png" title="plot of chunk geom_melted_cormat" alt="plot of chunk geom_melted_cormat" style="display: block; margin: auto;" />


- Check with journal about size, resolution etc.


```r
?pdf
```


```r
?png
```

Export Figures
========================================================
incremental: true
right: 70%
<img src="Data_Visualization-figure/geom_melted_cormat-1.png" title="plot of chunk unnamed-chunk-20" alt="plot of chunk unnamed-chunk-20" style="display: block; margin: auto;" />

***

```
png(file = "cortile.png", width = 7, height = 6, units = "in", res = 300)

ggplot(data = melted_cormat, aes(x = Var1, y = Var2, fill = value)) + geom_tile() + theme(axis.text.x = element_text(angle = 45, hjust = 1))

dev.off()
```
```
list.files()
```
~~If time create and export more figures~~

Tasks for the afternoon: Basic
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-21" alt="plot of chunk unnamed-chunk-21" width="80%" style="display: block; margin: auto;" />

***

- Check your data for interesting trends and correlations
- Use scatter plots, barcharts and boxplots
- Bootstrap and vary the sample and run the same analysis and plots
- Save your most interesting figure and share it with us tomorrow

Tasks for the afternoon: Advanced
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-22" alt="plot of chunk unnamed-chunk-22" width="80%" style="display: block; margin: auto;" />

***

- Import data from an external source (e.g. FAO, World Bank)
- Display those data in an interactive plot
- Play around with the design
- Export your most interesting figure and share it with us tomorrow

Be prepared for tomorrow
========================================================
incremental: true

Install Git & join Github (if you have not already). 

Git
<small>https://git-scm.com/downloads</small>

join Github
<small>https://github.com/</small>

*** 

![](R_Git_GitHub-figure/octocat.png)
