<%*
// Define the list of folders  
const folders = ["book-review", "christianity", "concepts", "creative", "innovate", "gratitude", "news", "posts", "quotes", "sacrament-symbols", "silvermineai", "tech"];

// Use the suggester to let the 
// user choose a folder  
let folder = await tp.system.suggester(folders, folders);


// Get current date  
let date = tp.date.now("YYYY-MM-DD HH:mm:ss");
let ymd = tp.date.now();
const yday = moment().add(-1, 'days').format("YYYY-MM-DD")

// Ask for a title  
let slug
let title

if (folder === 'news') {  
	slug = `${ymd}-news-notes`;
	title = `News Notes for ${ymd}`;
} else {

title = await tp.system.prompt("Post title:");

// Convert title to a slug  
let fileNameSlug = title  
	.toLowerCase()  
	.replace(/[^\w\s-]/g, '') // Remove punctuation  
	.trim()  
	.replace(/\s+/g, '-'); // Replace spaces with dashes

// Define a file slug
if (folder === 'goals') {  
	slug = tp.date.now() + "-goals";
} else {
    // ask the user if they agree with the slug
    // slug = await tp.system.prompt("Slug/Filename:", fileNameSlug)
    // skip asking
    slug = fileNameSlug
}
}


if (folder === 'gratitude') {  
	title = `I'm Grateful for ${title}`
}


// YAML front matter  
let content = `
title: "${title}"
date: "${date}"  
created: "${date}"
categories: ${folder}  
draft: false`;

// Additional properties
if (folder === 'book-review') {  
	content += `  
author: x	
book-year: 2029
book-time: 0
date-start: "${date}"
date-finished: "${date}"
finished:`;
} 

if (folder === 'goals') {  
	content += `  
meditate: false
pray: false
strength: false
cardio: false
cardio-type: ""
exercises: ""
muscle-groups: ""
notes: ""
observations: ""`;
} 


content += `
`;

let body = ""; 
if (folder === "sacrament-symbols"){
  body += "# Symbol\n\n# Scriptures\n\n# Meaning\n"
}
if (folder === "christianity"){
  body += "# Scriptures\n\n# Meaning\n"
}
if (folder === "innovate"){
  body += "# Problem\n\n"
  body += "# Why? Size?\n\n"
  body += "# Workarounds\n\n"
  body += "# Current Solutions\n\n"
  body += "# Improved Solution\n\n"
}
if (folder === "quotes"){
  body += `${title}`
}

const filepath = `${folder}/${slug}`  
await tp.file.move(filepath)  
-%>---<% content %>---
<% body %>
