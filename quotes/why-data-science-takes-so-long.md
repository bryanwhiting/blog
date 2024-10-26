---
title: "Why data science takes so long"
description: |
  _
date: "2024-03-14 12:24:00"  
created: "2024-03-14 12:24:00"
categories: quotes  
draft: false
---
i think I finally figured out why data science tasks take so long: everything is either a spike or a bug. 

Imagine you're building a function to compute a histogram. Well, simple: sort the data, bin it. Return the bins. Write a unit test to see if the inputs match the outputs. 

Now imagine using that: why are the data skewed? Bimodal? What's up with that outlier all the way on the tail? Who collected this data anyway? Oh, I did?! What'd I mess up in my data processing??

The easy stuff is writing the code for the hyperparameter tuning or model fit, etc. the hard stuff is...the data. 

Thoughts?

#datascience #engineering #agile 