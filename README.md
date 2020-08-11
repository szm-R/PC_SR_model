---
title: "Modeling Self-Regulation with ODEs"
author: "Seyyedeh Zeinab Mousavi"
date: "8/10/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Prject workflow

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r, echo=FALSE}
library(DiagrammeR)
DiagrammeR::grViz("digraph {
  graph [layout = dot, rankdir = TB]
  
  node [shape = rectangle]        
  rec1 [label = 'Generating parameters']
  rec2 [label = 'Constructing the ODE']
  rec3 [label =  'Solving the ODE']
  rec4 [label = 'Sampling from the solutions']
  
  # edge definitions with the node IDs
  rec1 -> rec2 -> rec3 -> rec4
  }", 
  height = 500)
```


## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
