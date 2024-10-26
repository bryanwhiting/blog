---
title: What is a model?
description: |
  Putting the mysterious in context. 
date: 2022-11-12
categories: [data science]
draft: false
---

![](../write-despite-ai/photo.jpeg) 

::: callout-note
## TL;DR: 
:::

## I’m building a model, you know 

The first time I heard the word “model” was from an engineering professor in college. I had no idea what he meant so I asked him. He looked at me like many who have forgotten their own ignorance and just said “Some calculations in excel. You know.”

_No, you don’t know. But nod your head so you don’t look like an idiot._ “Right, of course.” 

Why this moment was intriguing to me is one of my personal mysteries. But it was one of those odd moments that stuck. I’m now here to help my old self make sense of the world. 

## The Same Name for Different Things

When I told my mom I build models for a living she shook her head. Turns out my dad had been telling her for years that he builds financial models, yet she never figured out exactly what it was that he did. 

Let’s be clear on the common ground. A “model” per the dictionary is “simplified description, especially a mathematical one, of a system or process, to assist calculations and predictions.” By this definition, my dad and I do the same thing. We use numbers to put structure on the world. 


## Types of Models

A financial model is different than a statistical model is different than a physical model or a 3D architecture model. But they all do the same thing: use numbers to put structure on the world. 

Every model has a few things in common:
- They make assumptions about the world 
- They use data
- They probably make some calculations to help someone make a decision

A financial model might make assumptions in a spreadsheet about how many customers you’ll get per month for the next 12 months. This doesn’t seem complicated, and it shouldn’t: models don’t have to be complicated. 

A data science model is one that might try to predict whether a customer is going to click on an ad. 

## How does a model work?

The purpose of a math model is to imitate the “data-generating process”. Meaning, if you have some data on your customers (what they purchased and when), you would hope that there’s some rules that your customers are operating under. If you knew their income, their budget, their preferences, etc then you can guess how much they have to spend at a given time. Thus, if you know how much gas is in their tank, the mileage of the vehicle, the MPG of the vehicle, you can predict when they’ll stop to fill up on a road tip. When they fill up, they generate some data. “Bob purchased $34.52 of gas on Monday at 5:43pm.” Why did they purchase at that time of day? And why did they spend exactly $34.52?

If all you have outcome/results data then you can’t ever make predictions. But if you know what type of car Bob drives, how often he drives, how much gas he had in the morning when he left his house, etc, you can start to predict when he’ll next fill up. 

The assumption behind a model is that what was true in the past will remain true in the future. 

Why have there been so many issues because of COVID? Nobody could have predicted a world wide pandemic. The world wasn’t the same. All the models stopped working. Supply chain models. Financial models. Default models. All of these assumptions across all industries started breaking down. 

## How do you build a data science model?

Most people build models every time they calculate the “mean”. This is the most ubiquitous model and anybody can use it. Sum your revenue and divide by number of purchases. 

If you want to predict revenue for next Monday, just take the average revenue for every past Monday. That’s a model. 

If Monday is a holiday or the Monday after Black Friday, your model might be very wrong. So you estimate black Friday’s sales by looking at last year’s sales. “Last Cyber Monday  we sold 2x more than we typically do on a Monday.  So I’ll predict that on this upcoming Cyber Monday I’ll do 2x more than what I did in the most recent Monday”

Now that you’re taking in some data, your building a model. You’re translating a theory on how the world works into numbers. You’re taking last year’s sales and using it to predict tomorrow’s sales. 

## Start Simple

Whenever I build models, I always try to start simple and see if something more complicated can beat it. 

1. Use averages 
1. Build a rules-based model
2. Build a regression model/machine learning model
3. Build a ML model with rules on top of it

If I’m trying to predict whether a user will click an ad, the simplest model is “what % of all users clicked this ad in the past?” If 20% of all users who see an ad click on it, then my “model” is “predict a 20% chance of click”.

Then to make it more complicated, you can segment your users. “10% of men click on this but 25% of women do.” You now have more data and better predictions. 

A “decision tree” is a machine learning algorithm that just finds those segments in your data. “If man age 30 in Chicago then 22.3% chance of clicking based on all past behavior of all 30-year old men in Chicago”. It’s called a decision tree because it will put every user into mutually exclusive groups. 

Some “business logic” model might be making predictions around how your business operates. For example, if there’s a sale you may know that clicks increase. 



