<%*
// Define the list of folders  
const folders = ["book-review", "christianity", "creative", "goals", "gratitude", "posts", "sacrament-symbols", "tech"];

// Use the suggester to let the 
// user choose a folder  
let folder = await tp.system.suggester(folders, folders);

// Ask for a title  
let title = await tp.system.prompt("Post title:");

// Convert title to a slug  
let fileNameSlug = title  
	.toLowerCase()  
	.replace(/[^\w\s-]/g, '') // Remove punctuation  
	.trim()  
	.replace(/\s+/g, '-'); // Replace spaces with dashes

// Define a file slug
let slug
if (folder === 'goals') {  
	slug = tp.date.now() + "-goals";
} else {
    slug = await tp.system.prompt("Slug/Filename:", fileNameSlug)
}

// Get current date  
let date = tp.date.now("YYYY-MM-DD HH:mm:ss");


// YAML front matter  
let content = `
title: "${title}"  
description: |
  xxx  
date: "${date}"  
created: "${date}"
categories: ${folder}  
draft: false`;

// Additional properties
if (folder === 'book-review') {  
	content += `  
date-start: "${date}"
date-finished: 
pct-complete:`;
} 

if (folder === 'goals') {  
	content += `  
strength: false
cardio: false
meditate: false
pray: false
notes:
observations:`;
} 


content += `
`;

const filepath = `${folder}/${slug}`  
await tp.file.move(filepath)  
-%>---<% content %>---
