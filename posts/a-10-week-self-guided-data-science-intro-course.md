---
title: Become a Data Scientist in 10 Weeks
description: You only need the desire. The rest is freely accessible. Focus on breadth at first and creating content for your resume (tips included on that too!)
date: 2024-01-26 21:59:18
created: 2024-01-26 21:59:18
categories:
  - posts
  - data science
  - featured
  - career
  - recommendation systems
  - A/B testing
  - analytics
  - beginners
draft: false
subtitle: How to break into data science with an understanding how the modern data economy works
---
How do you get a job in data science if you currently aren't a data scientist?

::: {.callout-tip}
The simplest thing you can do to get experience is do 5 Kaggle competitions and use ChatGPT like crazy to learn how to code, annalyze data, and build models. Use the ChatGPT code interpreter for $20/month and see how it works. Test its limits. If you're new to data science, you won't understand where it's wrong, so just ask it: "how might this answer you gave me be wrong?"

The rest of this focuses on how to master the fundamentals, which will take you much farther and give you a foundation to build off of. But when in doubt, "doing" data science is much better than "learning" data science from books. Always strike a balance in your efforts: it takes far less time to read and learn principles, but it's far more valuable to try "doing" a data science project with code. 
:::

# My path to DS

I asked this question while working as an analyst 8 years ago and wanting to break into data science. I wrote about it back then (lost the post), so I'm gonna revisit it now. 

I was asked this question today: "how do I get started and get a job in data science if I don't have any experience?" You may then wonder "I can't get experience without a job...this is a chicken-and-egg problem." False. 

Simple: get experience. For free. In 10 weeks. Write a good resume. Network like crazy: connect with real people (and not just spam). Get rejected probably 20-30 times, learn from each rejection, keep learning and presto, you'll finally have an offer. It's honestly just a numbers game. Everyone "ahead" of you is an imposter just like you. Just figure out enough basics and you'll be ready for your first job. 

There are a million ways to do this, and a million blog posts like this one. But here's my suggestion. Enjoy!

![Some O.G. Data scientists](../img/dalle-plato-socrates-archimedes-and-r-a-fisher.jpeg){.preview-image}

# No Single Data Science Definition

Look at 10 job postings for data science and you'll see 10 unique definitions for a data scientist. Roughly, I'd categorize them as such:

1. Human decision support: someone who supports others in their decision making. This would be their boss, their team, etc. Decisions are: should we shut this line of business down? Are our customers churning and how do we prevent that?
2. Machine Decision Support: someone who helps machines make automated decisions, like whether to approve an online credit card application, recommend a YouTube video, etc. 
3. Product developer: someone who uses data to build a web product or service. This is similar to machine decision support, but the role might be in a SaaS capacity. 

Most of these things below will help with 1-2. Today, AI products are all the rage and I offer one week on deep learning to get you interested in 3. That being said, all the principles in each one of these sections is important in any field you pursue. 
# Mindset

While doing the following, on weeks 2-10, write one blog post to outline what you learned. 

1) Where did you start? Why was it hard to learn? What did you want to know? 
2) What concepts were new to you? 
3) Do something with that knowledge. Search the internet to find data you can write about. 

If you don't get very far, just move on to the next topic. Breadth is better early on to find out what you enjoy. Don't get caught up in the details. Skim more. Write more. Worry less. You got this. 

In all things, use ChatGPT to tutor you. Ask it questions. Be relentless. Have it explain things to you like you're five. 

Balancing learning between real books and ChatGPT is the best combo. ChatGPT is a better teacher, and the books have real info in them you can more fully trust. Using both together will get you there faster. 

If any of the books below don't vibe for you, there are a million free books out there. Find a simpler one and the same topic (and post in the comments so I can add it!)

# Week 1: Prepare to Share

> By creating a blog you demonstrate the following: you like to learn, you can communicate, you can do hard things, you're naturally curious, you're contributing to the ecosystem. Lots of ways to show those things, but having a blog is at least one way. 

- Set up a blog. 
	- Medium.com
	- Substack.com
	- (Harder) Or use [Quarto](https://quarto.org/) and publish on GitHub
- Find 5 blogs by top data scientists. Read their posts. See what they write about. 
- Your first blog post is about what you like about these 5 blogs. 
- Share your blog post on all social media. LinkedIn, Twitter, Facebook. 

# Week 2: Storytelling

> You can't get credit for great data science work unless you can tell a story. Now that you have a blog, learn how to write about data. 

- [Telling Stories with Data](https://tellingstorieswithdata.com/)
- Find three data-focused blogs that use charts and analysis. Economist, FiveThirtyEight, DataIsBeautiful, etc. 

# Week 3: Analytics and Data Intuition

> To be able to make predictions about the future, you first need to understand how to understand the past.

Analytics is the foundation of data science. It's the process of manipulating data and reshaping it to see it in new ways. 

- [Python for Data Analysis, 3E](https://wesmckinney.com/book/) - written by the creator of `pandas`
- [R for Data Science (2e)](https://r4ds.hadley.nz/) - written by the creator of `dplyr`, the best data manipulation language ever. 

Both these books are great. Read both. It's good to learn early that there are multiple right ways of doing your analysis the wrong way 😉. Seeing how to think in two languages is actually easier than getting stuck on one. 

Related: understand the bias in your data.

- [Thinking Clearly: A Data Scientist’s Guide to Understanding Cognitive Biases \[eBook\] – Data Science Horizons](https://datasciencehorizons.com/thinking-clearly-data-scientist-guide-understanding-cognitive-biases/)
- [Top 5 Biases in Data Science to Know for Model’s Accuracy](https://www.analyticsinsight.net/top-5-biases-data-science/)

# Week 4: Data Visualization

> Learning how to make a plot is like learning how to write. Learn how colors work. When to use them. When to use a bar vs. a line chart. How to make ideas shine. 

- [Visualization Curriculum](https://jjallaire.github.io/visualization-curriculum/)
- [R Graphics Cookbook, 2nd edition](https://r-graphics.org/)

This is after analytics because analytics is more important (knowing what to look for and how to think about data) than plotting it.

There are two types of plots: those for you to learn from and those for others to learn from. First, learn what's in the data. Learn for yourself. 

> "Look at the plot. Look at the plot. No seriously, look at the plot."
> Chris Peterson, Capital One

Second, plot for other people. After you've learned something by sifting out all the noise, learn how to communicate that externally.

Beautiful plotting is really hard and time consuming. Details can take hours. Focus on the basics at first. The simplest plot focuses on "what's the one thing I want someone to take away from this?"

# Week 5: Get Data You Don't Yet Have

> If you work at a company > 50 people, your company's data is probably stored in a database. Learning how to get this data so you can do data analytics and visualization will help you be self sufficient. 

Analytics is more important than this, because someone else may be able to get you the data. Or, once you know analytics then you can use SQL to *do* analytics. 

Three primary ways to get data include the following:

1. SQL (from a database, returns a spreadsheet like table)
2. API (get data from a website, returns JSON data)
3. Webscraping (getting it yourself, this is considered "unstructured" data)

Interactive tutorials here are the way to go. Just google around for some good ones.  

- [SQLBolt - Learn SQL - Introduction to SQL](https://sqlbolt.com/)
- [Python API Tutorial: Getting Started with APIs – Dataquest](https://www.dataquest.io/blog/python-api-tutorial/)
- [A Practical Introduction to Web Scraping in Python – Real Python](https://realpython.com/python-web-scraping-practical-introduction/)

# Week 6: Intro to Machine Learning

> This book nails the foundations of machine learning. Doesn't get too mathy, but teaches you the principles. 


- [An Introduction to Statistical Learning](https://www.statlearning.com/)
- For reference, a more mathy and dense book that supports the Intro book is [Elements of Statistical Learninf](https://hastie.su.domains/Papers/ESLII.pdf)

For content on how to get insights from machine learning models:
- [Interpretable Machine Learning](https://christophm.github.io/interpretable-ml-book/)

Additional
- understand the bias in your models [Tobias Baer - Risk Management, Data Science, and Psychology](https://www.tobiasbaer.net/algorithmic-bias)
- [4. Managing Bias in Machine Learning - Machine Learning for High-Risk Applications](https://www.oreilly.com/library/view/machine-learning-for/9781098102425/ch04.html)

# Week 7: Regression Analysis

> Regression Is key to getting insights out of data. It's what sets you apart from a data analyst role. 

- [Welcome | Handbook of Regression Modeling in People Analytics: With Examples in R, Python and Julia](https://peopleanalytics-regression-book.org/)
- [Regression and Other Stories](https://avehtari.github.io/ROS-Examples/)

# Week 8 Choose your own Adventure

## A/B Testing and KPI Optimization for Online Companies (applies to offline too)

> All big internet companies use A/B testing, or split testing, to make decisions about how to improve their product. If you're interested in software, or understanding how all modern websites and software are improved, you need to understand A/B testing. 

If You've taken stat 101, this is where the "t.test" gets used to literally make Big Tech billions of dollars. I'm not kidding. It's simple, but it's powerful. 

- [It’s All A/Bout Testing: The Netflix Experimentation Platform | by Netflix Technology Blog | Netflix TechBlog](https://netflixtechblog.com/its-all-a-bout-testing-the-netflix-experimentation-platform-4e1ca458c15)
- A seven part series by Netflix: [Netflix: A Culture of Learning. Martin Tingley with Wenjing Zheng… | by Netflix Technology Blog | Netflix TechBlog](https://netflixtechblog.com/netflix-a-culture-of-learning-394bc7d0f94c) I put here the seventh post because it likes to parts 1-6 in the intro. This part 7 is probably the best to start with because it explains the context behind A/B testing.
- [Experiment Guide – Accelerate innovation using trustworthy online controlled experiments](https://experimentguide.com/) This book tells you how Microsoft, Amazon, and Google use online experimentation to make billions of dollars. It's written by the people who invented online experimentation and who are top data scientists at those companies. 
- [Sequential A/B Testing Keeps the World Streaming NetflixPart 1: Continuous Data | by Netflix Technology Blog | Feb, 2024 | Netflix TechBlog](https://netflixtechblog.com/sequential-a-b-testing-keeps-the-world-streaming-netflix-part-1-continuous-data-cba6c7ed49df)

#  Time Series Data

> All modern data is time series data in some way (data collected over time). Even though you may not use forecasting in everything or what not, understanding the nature of that data will set you apart. Focus on principles, not techniques as you may not use these specific techniques.

- [Forecasting: Principles and Practice (3rd ed)](https://otexts.com/fpp3/)

# Week 9: Intro to Deep Learning

> Deep learning is all the rage, and will change the future for everyone. It's vital you know how these systems work because this is the future of society. 

- [fast.ai - fast.ai—Making neural nets uncool again](https://www.fast.ai/)
	- Great courses that teaches you how to build ChatGPT and Image Generators and understand it. 

This YouTube videos and others by him are great:

{{< video https://www.youtube.com/watch?v=zjkBMFhNj_g >}} 

Also this:

{{< video https://www.youtube.com/watch?v=jkrNMKz9pWU&pp=ygUhbGFyZ2UgbGFuZ3VhZ2UgbW9kZWxzIGZvciBoYWNrZXJz >}}

# Week 10: Recommendation Systems

> If you're making automated decisions with data, you're probably using a recommendation system at some level. Recommendation systems typically focus on "what video does Bryan want given all the data we have on him and people like him?". But the principles also extend to: how do I recommend one course of action to my stakeholder?

I don't have great resources here, but getting the concepts down will help you understand how virtually every social media app or streaming service works. (Netflix, Spotify, Instagram, etc all use recommenders to figure out the content you're interested in. )

- [http://eliassi.org/charu\_recsys\_intro.pdf](http://eliassi.org/charu_recsys_intro.pdf)

# Week 11+: Do Projects

Now that you've studied analytics, data viz, regression, machine learning, and deep learning, create two blog posts or personal projects. 

- Build a dashboard using a Jupyter notebook that updates daily. You can host on GitHub using quarto to render the notebook and use GitHub actions to update it every day. 
- Create a model to predict who will win the next NBA game
- Analyze any data from data.gov 
- Kaggle competitions!

# Prepare your Resume

Now you've got 10 blog posts, which is 10 more bullet points on your resume than you had before you started. You've learned a ton if you only do 10% of all that's above. 

I've loved the advice I found written up here: [Writing a Tech Resume](2022-11-18-writing-a-tech-resume/index.md).

Once you have a good resume, find real people to give it to. Dont apply blindly online. Talk to everyone you know. Find people on LinkedIn and message them directly with a personal message. Use one of your blog posts in your message to tell them why you're a good fit for their role. Perhaps even write a blog post specific to data from their company!

Good luck!

