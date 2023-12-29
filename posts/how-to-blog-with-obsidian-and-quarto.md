---
title: Blogging with Obsidian and Quarto
description: ""
date: 2023-12-29
categories:
  - obsidian
  - quarto
  - tutorial
draft: false
---
::: callout-tip
First half is my philosophy on the relationship between learning, notetaking, and blogging. 

- I love to learn
- Writing helps me learn
- Publicly writing increases my focus

Second half is how I use Obsidian and Quarto, alternatives I've tried, and my actually flow. I detail what tools I use, how I use them. 

- set up relative links
- Have one img folder
- Use templater to manage new post templates and relative links 
- Use linter 
- Use commander for toolbar palette
- dataview to find drafts 
- Tags to flag ideas 
:::

I've had a blog since 2016. Started with Jekyll. Then blogdown. Tried medium in 2020 because it had a good mobile app and I was able to publish every day. Then I didn't know how to get my posts out of there so I lost interest. Then I found quarto, which I was excited about because I have always loved Rmarkdown (things like tabs, executable code, etc.). Then I tried Substack, which I did for a few weeks but eventually gave up because 1) no mobile app to write and 2) how do I get my stuff off of there?

Seth Godin writes every day, and I love his blog and take it as an inspiration. In one post he mentions how "some say do a podcast, others say write on platform x or platform Y". (Medium, Substack, etc.) He recommends: those tools always serve the 1%. If you're the 1%, you make money. Otherwise you don't. So you might as well own your own content. 

I know two Instagram and TikTok influencers with 100k and 300k followers respectively. The 100k made $5k in 2022. The 300k TikToker still makes maybe $100/mo. They each put in 20 hours+ a week. 

So I'm giving up the illusion I'll ever make money off a blog or my content. I write  because I always have. I write publicly now because I found a way to do so online, from my phone. 

This is how I blog daily using quarto (for the website) and Obsidian (for the editor).

# Own your platform 

After all the years blogging, giving up, coming back, etc, there are many things that are my personal needs. 

- Mobile first. I can't write at my computer. This isn't my job. 
- Footnotes: many blogging platforms don't allow for them or handle them well. Footnotes are essential in long content. 
- Customizable: I need to be able to add styling how I like it. This is part of the creative process. 
- Tags: having and filtering by tags is nice
- Portable: if I stop blogging for 9 months I need to be able to move it to the next shiny object platform. I need to own my content. I also don't like posting on LinkedIn or Facebook directly because I see my writing as my creative work. Those platforms don't let you save or share those links later on.  
- Relative links: I need to be able to link to other posts. This is part of the mental note taking journey. 
- Subscribe button. (Substack and Medium are built for this!)
- Comments: 99% of people don't comment, but when people reach out it feels like I did something for the world. It also makes the blog more approachable, even if nobody every posts. 
- Hackable/automatable: I need templates. I need code. I need to be able to automate things. (At one point I figured out how to set up automations to post straight to Instagram from GitHub actions. I'm going to bring that back!)

Substack does footnotes well, linking to  notes poorly, doesn't have a mobile editor for posts, and isn't portable. It handles tags, subscribers, and distribution extremely well, and makes it easy to have multiple publications. But it's got the vendor lock in. 

Medium had an excellent mobile editing experience, but again - vendor lock in. And you've gotta kinda buy into the Medium-way-of-doing-posts. 

All platforms have their vibe. If you want to be popular on TikTok, you gotta dance. Although I personally love to dance, I want my site to be creative and my own. 

# Why blog with obsidian/quarto?

Enter Obsidian and Quarto. Obsidian makes managing and editing content a breeze (things like draft management, sorting files, organizing images, etc is all super easy)

Why obsidian as my editor?

1. It makes writing markdown a breeze 
2. It has tons of extensions, such as managing footnotes, linting files, spell checked, wfc
3. It makes it really easy to link to other files (relative links)
4. It makes it easy to refactor (move stuff around)
5. It works with markdown. The files are just plain text files in my Files app on my iPhone. 

# Writing flow 

Every writer has their flow. The tools they use should reflect their mental process of writing, and not the other way around. If you're trying to get your brain to work like the tool does, rather than using tools that working like your brain, you're ngmi. If you're like me, you'll try it for a while and then give up. (I may give up after this post, but at least this post isn't saved on Blogger.com!)

Here's mine:

1. Get an idea 
2. Categorize it (religious, tech, life, etc)
3. Create a file. 
4. Mark as draft
5. Write some ideas
6. Edit it (if long), reread a few times 
7. Unmark as draft
8. Post to the internet, read a few more times in live version and make edits 
9. Tag it
11. Find old drafts, finish them 
12. Add an image, either from my phone camera or chatgpt. Save image in the right folder. 
13. Write alt text to the images. 
14. Create links to other entries. 
15. Make some footnotes for content that doesn't flow
16. Cry and debate if I'm a good writer or if anyone is even listening anymore 
17. Add a subscribe button
18. share a food one to social media
19. Check my Google analytics to see if I'm popular. Check subscribers to see if I got any. Wonder why I care anyway because I know I won't make money off this. 
20. Get an idea for a new post while reading a book and start again 

The process of getting ideas from a source, and writing from those ideas, makes me want to be able to connect the entry to the source (book or podcast). Sure, I don't have to write. And sometimes writing is wasted time (writing for writing's sake), but I enjoy it. 

# My writing flow with Obsidian and Quarto

At the risk of nobody ever reading this far, I'll keep this high level, and if someone cares about something ask me in the comments. 

First, see [Quarto from Phone](quarto-from-phone/index.md) to see how I set up Working Copy to sync my Obsidian repo with GitHub.

Here's my flow with obsidian:

1. Read a book. Create new book note using [new-post](../_templates/new-post.md) via the Templater obsidian plugin. This lets me create a new note in a folder of my choice, give a title, make a filename with a good url slug. Adds some categories automatically. 
2. When idea comes up, take note in book note. When substantial idea comes up, create a quick draft of a new post using Templater. Enable draft: true if i don't finish. 
3. Use Obsidian Dataview to create a list of all outstanding drafts. I can come back and finish. 
4. Use Obsidian Custom Sort to sort the files in my repo how I want. This package helped me to stop time-stamping my URLs (which I thought was good for sorting). Instead, I can sort by modified time (note custom sort isn't necessary for modified time sorting), but custom sort allows for sorting by yaml front matter. 
5. When I'm ready to post, create an image using ChatGPT app. Click on the image in the app, share, save to files. It will save to the img/ folder in my root. Next image? Saves here (iPhone remembers).
	1.  At some point I was creating folders for every blog post so I could reference images there. I'm giving this up for two reasons: 1) every file would then need to be named "index.md" and 2) more folders is more noise. So instead, I have one place for all images, which makes it easier to save and I don't have to click a bunch of subfolders every time I add an image. 
	2. Also, screenshot any photos you may want to add so as to remove the location metadata. 
6. Use Footnote Shortcut plugin to more efficiently write footnotes. Add a hotkey to the mobile obsidian editor toolbar to quickly add footnotes. [^1]
7. Set up an iOS shortcut to do a "git pull", "git commit", "git push" on the repo. Put this shortcut on my home page. Since I have a synced folder, this happens very efficiently![^2] 
8. Set up a github actions to build the blog using `quarto render`. See [Quarto vs. quartz for Obsidian blog](quarto-vs-quartz-for-obsidian.md)
9. Publish to GitHub pages with the docs/ folder. 

And that's it. That's my flow. If you like this, ask me a question. 

[^1]: This footnote is added with the tap of a button. Brilliant!
[^2]: You can also set up an automation to sync anytime you leave the app, but I've found that gets kind of annoying because sometimes there can be data loss with a git pull that happens without thinking about it. 