---
title: "Pinball Loss"
date: "2024-05-01 21:07:02"  
created: "2024-05-01 21:07:02"
categories: tech  
draft: false
---

I just learned about Pinball Loss: [How I made peace with quantile regression](https://mindfulmodeler.substack.com/p/how-i-made-peace-with-quantile-regression)

Essentially, it's a loss function that penalizes over vs under predictions. It can be used to help perform quantile regression and bias the predictions over or under the mean (which is what quantile regression does).

![Loss](../img/screenshot-pinball-loss-molnar.jpeg){.preview-image}