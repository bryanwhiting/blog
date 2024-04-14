---
title: Why you should log with Aimstack
date: 2024-04-02 22:15:37
created: 2024-04-02 22:15:37
categories:
  - tech
  - logging
  - machine learning
  - data pipeline
  - ml pipeline
  - data science
  - monitoring
  - ml-tools
draft: false
---

I've long idolized [Home | AimStack](https://aimstack.io/). It's a tool that allows you to track metrics and hyperparameters and a whole bunch of stuff. It lets you compare across experiments. 

![Aim landing lage](../img/screenshot-aimstack.jpeg){.preview-image}

I first built my own version of this in `RShiny` back in 2017 so I could compare AUC across experiments. 

I was using `h2o.ai` at the time which had this great flow for monitoring an individual experiment but made it impossible to compare across experiments. 

Then my company Capital One built `rubicon`: [GitHub - capitalone/rubicon-ml: Capture all information throughout your model's development in a reproducible way and tie results directly to the model code!](https://github.com/capitalone/rubicon-ml). This was cool and they open sourced it. It tracks parameters. 

But it pales in comparison to `aim`.

Aim can do all these things:

- Track hyperparameters
- Track learning curves (like a metric over time such as when building DL models and you're watching how the error decreases with each epoch)
- Track any `plotly` plot, which means you can put any EDA charts nicely organized in one place
- it captures all your `logging.info` calls so you don't need to use a remote logging thing like `cloud watch` to monitor long runs
- It has its own loggers if you want to differentiate 
- It lets you take notes on an experiment
- If lets you compare across experiments
- It lets you use locally or remotely as a remote API
- It tracks images, etc. 
- it connects with ML packages like `xgbost` to auto log. 
- It can even convert `MLFlow` data. 

It's incredible. Use it. It's free. 