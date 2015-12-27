marketVis: A Shiny Applicaton for the DDP Course Project
========================================================
author: ElGreco
date: 2015-12-27

marketVis is based on stockVis!
========================================================


Our Shiny App is based on ***Lesson 6*** of the online tutorial that can be found on 
the ***RStudio*** website. You can visit that page [here](http://shiny.rstudio.com/tutorial/lesson6/).


The original as well as our own App make use of the ***R*** package ***Quantmod***. They can both be used to download and chart market data from online sources such as ***Yahoo Finance***.

Both applications make use of a call of the form:

```r
library(quantmod)

data <- getSymbols("SPY", src = "yahoo", 
           from = "2014-01-01",
           to = "2014-12-31",
           auto.assign = FALSE)
```

How does marketVis differ from the original Shiny App?
========================================================

- We have changed the ***Application layout*** from ***Sidebar*** to ***Grid*** in order to get a bigger viewing area for our chart.
- We are using a ***Select Box*** widget rather than a ***Text Input*** so we do not need to look up the symbols of the market instruments we are interested in.
- The user can now add up to four ***Technical Indicators*** from a list of choices.
- The user can change the ***timeframe*** from ***daily*** (default) to ***weekly***.
- We have changed the chart ***type*** from ***"line"*** to ***"bars"*** to illustrate the Open/High/Low/Close information of the price activity.

Plot Example 1
=======================================================

Example of a plot produced by the original Shiny application:

```r
chartSeries(data, theme = chartTheme("white"), 
            type = "line", log.scale = FALSE, TA = NULL)
```
<div align="center">
<img src="img1.png" width=892 height=380>
</div>

Plot Example 2
========================================================
The same plot produced by our version of the app with some additional technical indicators:

```r
chartSeries(data, theme = chartTheme("white"), 
            type = "bars", log.scale = FALSE, TA = list(addVo(), addBBands(), addMACD(), addRSI()))
```
<div align="center">
<img src="img2.png" width=892 height=380>
</div>
