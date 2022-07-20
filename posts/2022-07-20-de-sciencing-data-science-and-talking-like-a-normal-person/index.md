---
title: De-sciencing Data Science and Talking Like a Normal Person
description: |
  How can data scientists bring their technical knowledge to a non-technical audience? Here are my lessons learned from seven years in the data trenches. 
date: 2022-07-20
categories: [data science, communication, principles]
draft: false
---

# Building a Data Science culture

::: callout-note
**TL;DR:** Always keep it simple and always bring it back to the business need. 
:::

A coworker once asked me for advice on how to bring technical rigor into a non-technical culture. 

# When the Simple Solution Wins

A few years back I wanted to see if I could predict which NBA team would win in their next match. FiveThirtyEight is a blog that does this every day. Could I build a model as good as theirs?

I built a few models and put up a [site](https://bryanwhiting.github.io/sports/). Below I have a table of accuracies for each of my models compared to FoveThirtyEight’s. 

![](photo.jpeg) 

What I learned is that Nate Silver’s FiveThirtyEight three models are only 66% accurate. In 20 hours I got a model as accurate (V02 above) as his using just team level data (win %, recent win streak, etc.) and no player data (injuries, etc.). Also my model was built using data from 2005-2017 to predict 2019 performance. His model was updated daily with recent stats. 

But even more glaring is that if I made a prediction on a single feature (Home % > Away %) I could achieve 63.7% accuracy. This feature is a 1 if the home teams win % is greater than the away teams win %, 0 otherwise. Meaning, the home team wins 63.7% of the time their season win % is higher than the away teams season win %. 

Was it worth building an XGBoost model with 30 features to get 65.8% accuracy when just a simple calculation is 63.7% accurate? Depends on business context and how valuable that 2% gain is and what the development/engineering cost of deploying a model is. But if I were you I’d start with the simple model to get it into production to start generating value and then come back later to optimize. 

Caveat: it took a lot of work to discover that feature. 90% of the problem was building the data set. So at the end, building a model was pretty simple once I had the data. (This is where cloud AutoML will take over going forward, sorry!.) And I needed the model to see the feature importance (this was the top feature.) This is a valid data science approach: use modeling to discover the patterns. But just because you have a model doesn’t mean it’s worth deploying. 

Keep it business focused: when building a recommendation system, start with “what’s most popular”. Why would you need K-means or whatever to begin? And can’t you build your own K-means by creating heuristic filters? For example: if you want to recommend me a shirt based on shirts I’ve searched, you can find all shirts of same color, price, and size and recommend those. Building a model to take into account dimensions, patterns, what others buy, etc is fine but should be a V2.  


# Mindsets 

There’s a temptation to act like an academic professor and use fancy jargon when working with your coworkers. Even worse, there’s a temptation to think you’re smarter than your coworkers because you know this mathy thing that they don’t. But remember this quote:

> When they are learned they think they are wise…^[2 Nephi 9:28]

This pride power struggle is your downfall for two reasons:

1. It blinds you to thinking your solution is good just because someone else can’t understand it. 
2. It blinds you from focusing on what matters most: getting the simplest and best solution. 

Your coworkers aren’t your students eating you. They’re your smart coworkers solving the same problems you are.

A better mindset is that of a professional athlete, like a football player. They might be dumb as bricks at times but they’re all incredibly smart players. Can you explain your technical solution like a pro football player would?

- Bad: “I built an XGBoost classification model that reduces the RMSE by minimizing the Gini coefficient on each node…”  
- Better: “I noticed that most users close the app after they reach this page. I tried looking at some reasons why and found a few common behaviors (DISCUSS, get feedback). I think we can predict when this will happen and here’s a framework to do that.”

There’s a temptation to think “I did all this technical work, I should get credit for it!” My manager once coached me, “Your stakeholders should be amazed by how simple you made it. Not by how complicated the problem is.” 

The best example I know of this is Chris Voss, an FBI negotiator. Listen to his podcasts or YouTubes. He’s a humble guy and doesn’t get into the technical stuff. He knows the principles and keeps the explanations simple. He helps you feel smart when you listen to him. He’s one of the best negotiators in the world and if you were having dinner with him you’d think he was a normal guy. This is how data scientists should be. 

# Bugs

There are two types of bugs in data science: Software bugs and data bugs. You’ll spend 80% of your ramp up time on a project setting up your environment, learning the data, trying to understand the primary keys and logging and unique values, etc. 

::: callout-tip
Nobody cares about how you do any of this (the same way you don’t care about how cereal ends up in your grocery store), but they do care _that_ you do it because it shows that you’re thinking about the right things. 

They’ll also worry that you’re spending too much time on the wrong thing, so make sure you believe your actions are solving a business purpose. 
:::


# Takeaways

- Focus on principles, not technical details. 
- Get the simplest, useful solution into production first to start creating value. Then figure out if it’s worth optimizing. If your product gets deprecated in 3 months then the fancy model will be wasted time anyway. 
- Your stakeholders should be amazed by how simple you made it. Not by how complicated the problem is.
- If you can’t explain a trend with a simple bar/line chart, a fancy regression model won’t do. 
- Start with the non-technical (basic math) solution. Then see if you can beat the basic math with a fancy model. Evaluate the cost/benefit of the technical solution relative to the dumb version. 
- when you have a fancy solution, make sure you compare it to the basic solution. Make sure you can beat the solution your teammates come up with. And make sure you carefully lead them from “their” solution to yours. “At first I tried X. X was fine. But X didn’t account for Y. So I built a model M and saw that M out performs X by 10%.”
- Just because you know/use math, doesn’t mean it’s right for the business. Data Scientists can easily be myopic because the work we do is challenging and deep in the weeds. 
- Your boss doesn’t care about the nature of the bugs, but you should try to bring first principles to the table so she can cover for you. “I keep hitting this bug in the data. Can we ask/work with Infra team to solve this because it eats my time.” 