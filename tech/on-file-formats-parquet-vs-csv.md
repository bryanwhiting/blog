---
title: "On file formats: parquet vs csv"
date: 2024-03-26 22:39:56
created: 2024-03-26 22:39:56
categories:
  - tech
  - reactions
  - news
  - data science
  - data engineering
draft: false
---
Came across this article today: [Robin's blog – Friends don't let friends export to CSV](https://kaveland.no/friends-dont-let-friends-export-to-csv.html?utm_source=tldrnewsletter)

This has largely been my experience too: go with the file format that's fast reading in and out. 

It's rare a data scientist with open a file on their computer rather than just `pd.read_*()` it in. 

In my last job, we were using `jsonl` files for no other reason than it how one person liked to use command line tools to analyze it. 

But if you're using command line tools to inspect a data file, and not just a Python repl, you've already gone down the wrong direction IMO. But what if you're on a remote server and don't have pandas installed? Yea, that's not something you should plan for. At that point, just scp the file to a place you can read it. 
