<%*
// Define the list of folders  
const folders = ["book-review", "christianity", "gratitude", "tech", "creative", "workout", "posts", "sacrament-symbols"];

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
if (folder === 'workout') {  
	slug = tp.date.now() + "-workout";
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

content += `
`;

const filepath = `${folder}/${slug}`  
await tp.file.move(filepath)  
-%>---<% content %>---
