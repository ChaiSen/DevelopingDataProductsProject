---
title       : Child's height prediction
subtitle    : Using linear regression as the prediction model
author      : Chai Sen
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : github      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

Height is known to be somewhat heriditary, hence knowing a parent's height there might be some way to predict the child's height. The app created attempt to predict the height of the user's child when the user key in his/her own height, in metres.

## Data and Model used

The data used in predicting the model is from the library(UsingR) in which the data father.son is used. There are a total of 1078 measurements of a father's height and his son's height.

The model used in prediction is a simple linear regression on the 1078 sets of measurements. The function predict will be used to predict the height of the user's child when the user keyed in his own height.

---

## Some codes used in the app

```r
library(UsingR)
data(father.son)
# Display the dataset, notice they are in inches
head(father.son, n = 1)
```

```
##    fheight  sheight
## 1 65.04851 59.77827
```

```r
# convert all observations to metres, 1 inch = 0.0254 metres
father.son$fheight <- father.son$fheight * 0.0254
father.son$sheight <- father.son$sheight * 0.0254
head(father.son, n = 1)
```

```
##    fheight  sheight
## 1 1.652232 1.518368
```

---

## Some codes used in the app (continue)

```r
#fitting the data into a linear model
fit <- lm(sheight ~ fheight, data = father.son)
#coefficients
fit$coefficients
```

```
## (Intercept)     fheight 
##   0.8607198   0.5140930
```

```r
#max height of father
maxFather <- max(father.son$fheight)
maxFather
```

```
## [1] 1.916022
```

---

## Additional Notes
Since the Model is built on the 1078 observations in which the minimum height observed is 1.49m and the maximum height is 1.92m. The application would be more accurate in predicting the user's child if the user's height is between these 1.49m and 1.92m. Also since the observation is based on father and son, perhaps it would be better to also consider how the mother's height would affect the child, also if the child is a daughter, the height predicted might not be as accurate.

##References on height genetics

http://www.scientificamerican.com/article/how-much-of-human-height/
http://genetics.thetech.org/original_news/news60
