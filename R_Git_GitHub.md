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

R is to RStudio as Git is to GitHub 
========================================================
author: Cory Whitney   (cory.whitney@uni-bonn.de)
font-family: 'Helvetica'
date: "2019-03-22"
autosize: true
css: mySlideTemplate.css
<img src="R_Git_GitHub-figure/github.png" style="background:none; border:none; box-shadow:none;height="400"; width="400";"><img src="R_Git_GitHub-figure/INRES_Logo.png" style="background:none; border:none; box-shadow:none;height="100"; width="100";"><img src="R_Git_GitHub-figure/Uni_Bonn_Picture.png" style="background:none; border:none; box-shadow:none;height="200"; width="200";"><img src="R_Git_GitHub-figure/ZEF_Logo.png" style="background:none; border:none; box-shadow:none;height="200"; width="200";">



Automated version control
========================================================
incremental: true

**Show of hands:**
- use 'cmd z' or 'ctrl z'?
- came to the office but left the work at home on another machine or USB?
- tried to co-author papers by emailing files back and forth?

<small>**Git** is an open source version control tool, **GitHub** is a company that hosts Git repositories in the web and provides a web interface to interact with repos they host.</small>

***

![](R_Git_GitHub-figure/final_doc_comic.png)

<div class="footer" style="margin-top;font-size:60%;"> 
https://swcarpentry.github.io/git-novice/guide </div>

Git: overview
========================================================
incremental: true
right: 80%
![](R_Git_GitHub-figure/git_logo.png)
<small>https://git-scm.com/</small>

***

A better way to:
- "undo" changes,
- collaborate than mailing files back and forth, and
- share code and other scientific work with the world.

<img src="R_Git_GitHub-figure/git_logo_orange.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="35%" style="display: block; margin: auto;" />

<div class="footer" style="margin-top;font-size:60%;"> 
<https://swcarpentry.github.io/git-novice/guide> </div>

GitHub: overview
========================================================
incremental: true
right: 80%
![](R_Git_GitHub-figure/octocat.png)

***

An easier way

<img src="R_Git_GitHub-figure/git_areas.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />


<div class="footer" style="margin-top;font-size:60%;"> http://r-bio.github.io/intro-git-rstudio/ </div>

Git and GitHub: getting stuck
========================================================
incremental: true
right: 80%
![](R_Git_GitHub-figure/octocat.png)
***

- If you get stuck, just add “Git” to a search query e.g. a short description of your issue
- Someone else has also been confused by it and has written about it
- Thousands of talented programmers who scan the web and answer these problems
<img src="R_Git_GitHub-figure/stack-overflow.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" width="50%" style="display: block; margin: auto;" />

<div class="footer" style="margin-top;font-size:60%;"> 
https://stackoverflow.com/ </div>

Git and GitHub: basics
========================================================
incremental: true
right: 80%
![](R_Git_GitHub-figure/octocat.png)
***

Install Git & join Github (if you have not already):

- install Git
<small>https://git-scm.com/downloads</small>

- join Github
<small>https://github.com/</small>


Some useful tips on getting these running from our friends 

- University of Zurich
<small>http://www.geo.uzh.ch/microsite/reproducible_research/post/rr-rstudio-git/</small>

- Nathan Stephens, a very helpful R blogger 
<small>https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN</small>

Git: Configure
========================================================
incremental: true
right: 80%
![](R_Git_GitHub-figure/git_logo.png)
<small>https://git-scm.com/</small>

***

<img src="R_Git_GitHub-figure/git_logo_orange.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" width="35%" style="display: block; margin: auto;" />

- `git reset --hard [commit hash]`
danger, this will discard all changes you've made in your working directory 

<div class="footer" style="margin-top;font-size:60%;"> 
<https://jennybc.github.io/2014-05-12-ubc/ubc-r/session03_git.html> </div>



GitHub: intro hello-world
========================================================
incremental: true
right: 80%
![](R_Git_GitHub-figure/octocat.png)
***
**GitHub** 
- a commercial website that lets you store repository publicly for free (get an education account with an uni email address)
- a friendly interface, no need to remember command line. 
- useful features including issues, wikis etc.

<img src="R_Git_GitHub-figure/Github-Icon-4.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />

GitHub: intro hello-world
========================================================
incremental: true

![plot of chunk unnamed-chunk-6](R_Git_GitHub-figure/Hello_world.jpg)

<small>https://guides.github.com/activities/hello-world/</small>

Tasks for the afternoon: Basic and Advanced
========================================================
incremental: true

- Go through your scripts again
- Add documentation
- Create an Rmarkdown file
- Export your script as html and pdf
- Upload your script to git
- Share your script with your classmates through git

- **Help future R courses! Fill out the feedback form.**



