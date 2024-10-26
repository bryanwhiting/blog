---
title: "Starting with Jekyll"
description: Hello world.
date: 2016-11-17
categories:
  - productivity
  - blogging
  - jekyll
execute: 
  freeze: true
---

Hello world. 

I wanted to start a blog. I wanted to set it up for free, use a custom URL (and not _something.bloggingplatform.com_), and be able to both blog and create tutorials. I didn't mind it possibly being technical[^1]. Enter Jekyll.

_If you want to get your blog in 10 minutes, skip to below._

[^1]: Specifically, I was interested in being able to use the command line for my posts. Additionally, I didn't mind seeing or using a little bit of code. 

# Why Blog with Jekyll?

Here's why you can and should blog with Jekyll (if you're a data scientist):
  
  2. Jekyll has beautiful, free, open-source templates.
3. GitHub will host your website for free[^2].
4. Jekyll is [static](https://www.smashingmagazine.com/2015/11/modern-static-website-generators-next-big-thing/).
5. Jekyll can be simple to set up[^3].
5. I tried Wordpress and blogger.com and got frustrated.
6. The blogging content you create is very portable (easy to take your posts from one blog site to another).
7. Creating blogs in Markdown syntax is a dream (even for non-technical folks).
8. You can manage your blog from your terminal
9. You can manage your blog from your phone (if you have a GitHub-editing app)

But if you don't like debugging occasional errors, you probably shouldn't blog with Jekyll.

What is Jekyll, you ask? Jekyll is an open-source blogging platform. Anyone can write a template and post it, and anyone else can use that template. Perusing [Jekyllthemes.org](http://jekyllthemes.org/), you can pick out any template you'd like.

[^2]: Someone has to [host] it (i.e., store and display all the files). I started off trying to set up a WordPress blog, but you have to pay another company to [host](http://www.webhostingbest10.com/web-hosting-reviews). I didn't want to bother.

[^3]: If you try to set it up by following the instructions on [jekyllrb.com](https://jekyllrb.com/), that's the complicated way. That's how I originally started, got lost for five hours, and stopped. Six months later, I found a better way.



[host]:https://www.google.com/search?q=what+does+it+mean+to+host+a+website&oq=what+does+it+mean+to+host+&aqs=chrome.0.0j69i57j0l4.2810j0j9&sourceid=chrome&ie=UTF-8

# How did I get started with Jekyll? 

As a blogging noob, I've discovered there are hundreds of ways to generate a blog (e.g., WordPress, Squarespace, blogger.com, Weebly, etc.). But when my colleague [Arthur Lui](http://luiarthur.github.io/) showed me his blog, I wanted something similar. I first tried Wordpress, then tried blogspot, then gave up and followed Arthur's example and landed with Jekyll.

# Set up a blog in 10 minutes!

I followed this Jekyll [tutorial] to set up my first blog. I'll simplify those steps here to get you up and running quickly:

[tutorial]:https://www.smashingmagazine.com/2014/08/build-blog-jekyll-github-pages/

1. Get a GitHub account. (2 min)
2. Go to [Jekyllthemes.org](http://jekyllthemes.org/). All of these blog themes are free. Find one you like, and Fork the repo (i.e., "repository"). (2-60 min, depending on how long you peruse)
4. In GitHub, rename the newly-forked repo from "REPO name" to "yourgithubusername.github.io". (1 min)
5. Now go to "githubusername.github.io". Voila, you have a blog. 

And if you want to start writing posts, go to your "_posts" folder. Then create new files and follow the default templates that the repository provides. (The blogs will need to be written in Markdown syntax.)

That was my 10 minute promise. If you feel a bit cheated or lost, go to the well-done [tutorial] and do all the steps. But the steps I listed are the essential steps to setting up a blog from scratch. So if you want to make a few blogs really quickly, after you figure out the first one the others follow nicely. For example, once I finished the tutorial, I followed those steps above to try two other themes before deciding on the [Centrarium](https://github.com/bencentra/centrarium) theme. 

To get Centrarium to work, I did have to change some configurations in the "_config.yml", so there can be some minor debugging depending on the theme you choose. But with a little patience and some Googling, you'll get it.

# Add to Jekyll a custom URL from GoDaddy

You'll notice I have a custom URL and not "bryanwhiting.github.io". I used GoDaddy to get a domain. (I have no affiliation with GoDaddy.) Here's how I linked GoDaddy with my GitHub Jekyll blog:
  
1. Get a domain.
2. In your Github repo, change (or create) a CNAME file in the main directory. (See my [CNAME](https://github.com/bryanwhiting/bryanwhiting.github.io/blob/master/CNAME) file for an example). And for the CNAME file contents, just type in the new "www" that you registered through GoDaddy.
3. Then, on GoDaddy, go to the section "DNS Management". Here's where you tell GoDaddy how to connect your newly purchased "www" with GitHub. Create the following connections:
4. [Type, Name, Value, TTL] = [A, @, 192.30.252.153, 600 seconds]
5. [Type, Name, Value, TTL] = [A, @, 192.30.252.154, 600 seconds]
6. [Type, Name, Value, TTL] = [CNAME, ftp, yourgithubusername.github.io, 600 seconds]
7. [Type, Name, Value, TTL] = [CNAME, www, yourgithubusername.github.io, 600 seconds]

If you have the CNAME file in your GitHub folder, GitHub and GoDaddy will talk and after a few minutes your custom "www" will work. You don't technically need the two [A] steps, but those connections allow users to type "[bryanwhiting.com](http://www.bryanwhiting.com)" instead of "www.bryanwhiting.com". It can take up to 24 hours before these [A] connections enable, so don't be worried if the short URL doesn't work first try. But the full URL should work soon enough.