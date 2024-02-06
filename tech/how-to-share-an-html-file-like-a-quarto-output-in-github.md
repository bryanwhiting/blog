---
title: How to share an HTML file (like a quarto output in GitHub)
description: Do you have an HTML file saved on GitHub that you'd like to share?
date: 2024-02-06 09:44:38
created: 2024-02-06 09:44:38
categories:
  - tech
  - quarto
  - github
  - data science
  - html
draft: false
---
Let's assume you have a raw HTML file on GitHub, such as a Jupyter notebook you rendered to HTML or a Quarto doc you rendered via `quarto render`.

If you try to share the link from GitHub directly, GitHub will just show the raw HTML file. 

Use this link to convert it to your dashboard:

[GitHub & BitBucket HTML Preview](https://htmlpreview.github.io/)

Example:

GitHub File: https://github.com/bryanwhiting/blog/blob/gh-pages/index.html

![Preview in GitHub](../img/screenshot-raw-html-on-github.jpeg){.preview-image}

Preview using that link: https://htmlpreview.github.io/?https://github.com/bryanwhiting/blog/blob/gh-pages/index.html

Notice the URL at the bottom

![Render HTML](../img/screenshot-html-file-on-github-rendered.jpeg){.preview-image}
