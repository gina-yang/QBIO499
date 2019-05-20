# Assignment 5: R and the Bootstrap

#### 14 February 2019

The bootstrap method is a resampling technique used to estimate various statistics (such as mean or standard deviation) in a population. It is used often as a machine learning technique and works by repeatedly and uniformly sampling a dataset with replacement. One advantage of bootstrapping is that a confidence level can be bound to the estimate.

This bootstrap function calculates confidence intervals. The function is written as

```R
confInterval = bootstrap(v, confWidth, sampleCount, FUN, ...)
```

where 
- ```v``` is a vector to sample from
- ```confWidth``` is the confidence interval width (ex. for 95% confidence input 0.95)
- ```sampleCount``` is the number of uniform samplings to carry out
- ```FUN``` is a function with an output with the desired statistic (ex. mean, standard deviation) ```...``` denotes any inputs to that function

The output of ```bootstrap()``` is a vector with two elements representing the upper and lower bounds of the result of ```FUN``` with a confidence interval of ```confWidth```

For this assignment's purposes an additional function was written that calculates the fraction of entries in a vector ```v``` above a certain threshold ```th```:

```R
frac = fracAboveThres(v, th)
```

Examples of commands used to bootstrap ```fracAboveThres()``` for a vector can be found in ```hw5commands.R```.
