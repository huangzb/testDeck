---
title       : Normal Approximation of Binomial Distribution
subtitle    : 
author      : 
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Motivation

1. For Binomial Distribution B(n, p), when n is large, can be approximated by Normal Distribution N(np, np(1-p))
2. The shiny app is designed for the user to interactively tune n, p and observe the approximation.

--- .class #id 

## Part of server.R
1. calculated binomial and normal distribution with dbinom and dnorm.
2. Plot two distributions on the same plot. 

        output$plot <- renderPlot( {
                n <- input$n
                p <- input$p   
               mean <- n * p
               sd <- sqrt(n * p * (1 - p))
               
               x <- seq(0, n, by=1)
               x2 <- seq(0, n, by = 0.01)
               y <- dbinom(x, n, p)               
               z <- dnorm(x2, mean, sd)
               plot(x2, z, type = "l", col = "green", lwd = 5, 
                    main = "Normal Approximation of Bionomial Distribution")
               lines(x, y, type = "h",  col = "red", lwd = 5)    
               legend("topright", c("Normal Approximation", "Binomial Distribution"),
               lty=c(1,1), lwd=c(5, 5), col=c("green","red"))                      
       }) 

--- .class #id 

## Part of ui.R
1. Read n, p value on sliders. 
2. Output Density Function Plot and mean and standard deviation of normal approximation.

        # Input n, p
        sidebarPanel(                
                sliderInput('n', 'n', min = 1, max = 50,
                            value = 6, step=1),
                sliderInput('p', 'p', min = 0.01, max = 0.99,
                            value = 0.5, step=0.01)                
        ),
        # Output Density Function plot 
        mainPanel(
                plotOutput('plot'),    
                h4('mean of normal approximation'),
                verbatimTextOutput('mean'),
                h4('standard deviation of normal approximation'),
                verbatimTextOutput('sd')
        )

--- .class #id 

## Snapshot of shiny app
<img src="./shinyapp.jpg", width="95%" height="95%"  />
