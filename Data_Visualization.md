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

- open RStudio
<img src="Data_Visualization-figure/rstudio-hex.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="20%" style="display: block; margin: auto 0 auto auto;" />

- **Help > Cheatsheets > Data Visualization with ggplot2**

- type ‘?’ in R console with function, package or data name
- Add “R” to a search with a copy of an error message
- Many talented programmers who scan the web and answer issues

<img src="Data_Visualization-figure/stack-overflow.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" width="20%" style="display: block; margin: auto;" />
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

<img src="Data_Visualization-figure/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" width="50%" style="display: block; margin: auto;" />
<small>Bar plot of number of observations of binary data related to academic parents </small>

***


```r
plot(participants_data$academic_parents, participants_data$days_to_email_response)
```

<img src="Data_Visualization-figure/unnamed-chunk-6-1.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" width="50%" style="display: block; margin: auto;" />
<small>Boxplot of days to email response grouped by binary data related to academic parents</small>

**Use help '?' for function**

```r
?plot
```

ggplot2: overview
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="70%" style="display: block; margin: auto 0 auto auto;" />

***

**Many libraries and functions for graphs in R...**

- **ggplot2** is one of the most elegant and most versatile.

- **ggplot** implements the *grammar of graphics* to describe and build graphs. 

- Do more and do it faster by learning one system and applying it in many places.

- Learn more about ggplot2 in “The Layered Grammar of Graphics”

<http://vita.had.co.nz/papers/layered-grammar.pdf>

<img src="Data_Visualization-figure/layered_grammer.jpg" title="plot of chunk unnamed-chunk-9" alt="plot of chunk unnamed-chunk-9" width="80%" style="display: block; margin: auto 0 auto auto;" />

ggplot2: qplot with participant data
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" width="70%" style="display: block; margin: auto 0 auto auto;" />

***


```r
library(ggplot2)

qplot(days_to_email_response, letters_in_first_name, data = participants_data)
```

<img src="Data_Visualization-figure/unnamed-chunk-11-1.png" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" height="30%" style="display: block; margin: auto;" />
<small>Scatterplot of days to email response as a function of the letters in your first name</small>

**Use help '?' for function**

```r
?qplot
```

<small>Want to understand how all the pieces fit together? See the R
for Data Science book: http://r4ds.had.co.nz/</small>

ggplot2: qplot with iris data
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" width="70%" style="display: block; margin: auto 0 auto auto;" />

***

**Example from Anderson's iris data set**


```r
qplot(Sepal.Length, Petal.Length, data=iris, color=Species, size=Petal.Width)
```

<img src="Data_Visualization-figure/unnamed-chunk-14-1.png" title="plot of chunk unnamed-chunk-14" alt="plot of chunk unnamed-chunk-14" style="display: block; margin: auto;" />
<small>Scatterplot of iris petal length as a function of sepal length with colors representing iris species and petal width as bubble sizes.</small>

**Use help '?' for data**

```r
?iris
```


ggplot2: qplot with your data
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-16" alt="plot of chunk unnamed-chunk-16" width="70%" style="display: block; margin: auto 0 auto auto;" />

***

**Example from your data**


```r
qplot(days_to_email_response, letters_in_first_name, color=academic_parents, size=working_hours_per_day, data=participants_data)
```

<img src="Data_Visualization-figure/unnamed-chunk-17-1.png" title="plot of chunk unnamed-chunk-17" alt="plot of chunk unnamed-chunk-17" style="display: block; margin: auto;" />
<small>Scatterplot of letters in your first name as a function of days to email response with colors representing binary data related to academic parents and working hours per day as bubble sizes.</small>

**Make more graphs**

ggplot2: qplot with carat data
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-18" alt="plot of chunk unnamed-chunk-18" width="70%" style="display: block; margin: auto 0 auto auto;" />

***

**qplot** accepts formula arguments such as log
```
plot1<-qplot(carat, price, data = diamonds)
plot2<-qplot(log(carat), log(price), data = diamonds,
```
<img src="Data_Visualization-figure/unnamed-chunk-19-1.png" title="plot of chunk unnamed-chunk-19" alt="plot of chunk unnamed-chunk-19" style="display: block; margin: auto;" />

**Use help '?' for data**

```r
?diamonds
```


ggplot2: qplot set parameters
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-21" alt="plot of chunk unnamed-chunk-21" width="70%" style="display: block; margin: auto 0 auto auto;" />

***

Set parameters manually with I()
```
qplot(carat, price, data = diamonds, alpha=I(0.1), colour=I("blue"))
qplot(carat, price, data = diamonds, alpha=I(0.4), colour=I("green"))
```

<img src="Data_Visualization-figure/unnamed-chunk-22-1.png" title="plot of chunk unnamed-chunk-22" alt="plot of chunk unnamed-chunk-22" style="display: block; margin: auto;" />
~~Inhibit Interpretation / Conversion of Objects~~

ggplot2: qplot with diamonds data
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-23" alt="plot of chunk unnamed-chunk-23" width="70%" style="display: block; margin: auto;" />

***

```
#Create a sample
dsmall <- diamonds[sample(nrow(diamonds), 100), ]
#Plot with different colours for color
qplot(carat, price, data = dsmall, colour = color)
#Plot with different shapes for cut 
qplot(carat, price, data = dsmall, shape = cut)
```
<img src="Data_Visualization-figure/unnamed-chunk-24-1.png" title="plot of chunk unnamed-chunk-24" alt="plot of chunk unnamed-chunk-24" style="display: block; margin: auto;" />
~~Different colors and shapes~~


ggplot2: geom
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-25" alt="plot of chunk unnamed-chunk-25" width="70%" style="display: block; margin: auto;" />

***

With “geom” different types of plots can be defined e.g. points, line, boxplot, path, smooth. 
These can also be combined in a vector.
```
qplot(carat,price,data=dsmall, geom="line")
qplot(carat,price,data=dsmall, geom="smooth")
qplot(carat,price,data=dsmall, geom=c("point","smooth"))
```
<img src="Data_Visualization-figure/unnamed-chunk-26-1.png" title="plot of chunk unnamed-chunk-26" alt="plot of chunk unnamed-chunk-26" style="display: block; margin: auto;" />
~~ggplot2 geom options~~

ggplot2: smooth function
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-27" alt="plot of chunk unnamed-chunk-27" width="70%" style="display: block; margin: auto;" />

***

Depending on your dataset size the smooth function will select different lines and smoothing methods.
```
qplot(carat,price,data=dsmall,geom=c("point","smooth"))
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

<img src="Data_Visualization-figure/unnamed-chunk-28-1.png" title="plot of chunk unnamed-chunk-28" alt="plot of chunk unnamed-chunk-28" style="display: block; margin: auto;" />
~~ggplot2 lines and smoothing options~~


ggplot2: Boxplots and jitter
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-29" alt="plot of chunk unnamed-chunk-29" width="70%" style="display: block; margin: auto;" />

***

- Boxplots can be displayed through geom=“boxplot”. 

```
qplot(color,price/carat,data=diamonds,  geom="boxplot")
```

- Jittered plots (geom=“jitter”) show all points. In case of overplotting changing alpha can help.

```
qplot(color,price/carat,data=diamonds, geom="jitter")
qplot(color,price/carat,data=diamonds, geom="jitter", alpha=I(0.1))
```

<img src="Data_Visualization-figure/unnamed-chunk-30-1.png" title="plot of chunk unnamed-chunk-30" alt="plot of chunk unnamed-chunk-30" style="display: block; margin: auto;" />
~~ggplot2 boxplots and jitter~~

ggplot2: Histograms
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-31" alt="plot of chunk unnamed-chunk-31" width="70%" style="display: block; margin: auto;" />

***

Histograms can be displayed through geom=“histogram”.
```
qplot(carat, data = diamonds, geom = "density")
qplot(carat, data = diamonds, geom = "density", colour = color)
qplot(carat, data = diamonds, geom = "density", fill = color, alpha=I(0.3))
```

<img src="Data_Visualization-figure/unnamed-chunk-32-1.png" title="plot of chunk unnamed-chunk-32" alt="plot of chunk unnamed-chunk-32" style="display: block; margin: auto;" />
~~ggplot2 histograms~~

ggplot2: subset
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-33" alt="plot of chunk unnamed-chunk-33" width="70%" style="display: block; margin: auto;" />

***

Use factor to subset your data.
```
qplot(displ, hwy, data = mpg, colour = cyl, geom=c("point","smooth"),method="lm")
qplot(displ, hwy, data = mpg, colour = factor(cyl), geom=c("point","smooth"),method="lm")
```

<img src="Data_Visualization-figure/unnamed-chunk-34-1.png" title="plot of chunk unnamed-chunk-34" alt="plot of chunk unnamed-chunk-34" style="display: block; margin: auto;" />
~~ggplot2 subset with smooth line~~



Correlation
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/spaghetti_monster.png" title="plot of chunk unnamed-chunk-35" alt="plot of chunk unnamed-chunk-35" width="70%" style="display: block; margin: auto 0 auto auto;" />

***


```r
cor.test(participants_data$days_to_email_response, participants_data$letters_in_first_name)
```

```

	Pearson's product-moment correlation

data:  participants_data$days_to_email_response and participants_data$letters_in_first_name
t = -0.64191, df = 7, p-value = 0.5414
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.7780668  0.5078670
sample estimates:
       cor 
-0.2357798 
```

**Use help '?' for function**

```r
?cor.test
```

Bonus: gganimate Datasaurus Dozen
========================================================
incremental: true
<img src="Data_Visualization-figure/gganimate_logo.png" title="plot of chunk unnamed-chunk-38" alt="plot of chunk unnamed-chunk-38" width="20%" style="display: block; margin: auto 0 auto auto;" />

- Using the datasauRus, ggplot2 and gganimate libraries.

```
ggplot(datasaurus_dozen, aes(x=x, y=y))+
  geom_point()+
  theme_minimal() +
  transition_states(dataset, 3, 1) + 
  ease_aes('cubic-in-out')
```

***

<img src="Data_Visualization-figure/unnamed-chunk-39-1.gif" title="plot of chunk unnamed-chunk-39" alt="plot of chunk unnamed-chunk-39" style="display: block; margin: auto;" />
  
Bonus: gganimate mtcars mpg
========================================================
incremental: true
<img src="Data_Visualization-figure/gganimate_logo.png" title="plot of chunk unnamed-chunk-40" alt="plot of chunk unnamed-chunk-40" width="20%" style="display: block; margin: auto 0 auto auto;" />

- Using the gifski, ggplot2 and gganimate libraries.

```
ggplot(mtcars, aes(factor(cyl), mpg)) + 
  geom_boxplot() + 
  geom_point() +
  transition_states(am, transition_length = 4, state_length = 1) + 
  view_follow()
```

***

<img src="Data_Visualization-figure/unnamed-chunk-41-1.gif" title="plot of chunk unnamed-chunk-41" alt="plot of chunk unnamed-chunk-41" style="display: block; margin: auto;" />

ggplot2: geom_tile
========================================================
incremental: true
right: 70%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-42" alt="plot of chunk unnamed-chunk-42" width="20%" style="display: block; margin: auto 0 auto auto;" />

- Using the dplyr, ggplot2 and reshape2 libraries.

```
part_data<-select(participants_data, days_to_email_response, number_of_siblings, years_of_study, number_of_publications, letters_in_first_name, km_home_to_zef, working_hours_per_day, days_to_email_response)
cormat <- round(cor(part_data), 1)
melted_cormat <- melt(cormat)
ggplot(data = melted_cormat, aes(x=Var1, 
y=Var2, fill=value)) + 
geom_tile()
```

***
<img src="Data_Visualization-figure/unnamed-chunk-43-1.png" title="plot of chunk unnamed-chunk-43" alt="plot of chunk unnamed-chunk-43" style="display: block; margin: auto;" />


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
<img src="Data_Visualization-figure/unnamed-chunk-46-1.png" title="plot of chunk unnamed-chunk-46" alt="plot of chunk unnamed-chunk-46" style="display: block; margin: auto;" />

```
png(file = "cortile.png", width = 7, height = 6, units = "in", res = 300)

ggplot(data = melted_cormat, aes(x = Var1, y = Var2, fill = value)) + geom_tile() + theme(axis.text.x = element_text(angle = 45, hjust = 1))

dev.off()
```
```
list.files()
```
~~If time export more figures of participants data~~

Tasks for the afternoon: Basic
========================================================
incremental: true
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-47" alt="plot of chunk unnamed-chunk-47" width="20%" style="display: block; margin: auto;" />

- Check your data for interesting trends and correlations
- Use scatter plots, barcharts and boxplots
- Bootstrap and vary the sample and run the same analysis and plots
- Save your most interesting figure and share it with us tomorrow

Tasks for the afternoon: Advanced
========================================================
incremental: true
right: 80%
<img src="Data_Visualization-figure/ggplot2.png" title="plot of chunk unnamed-chunk-48" alt="plot of chunk unnamed-chunk-48" width="20%" style="display: block; margin: auto;" />

***

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

