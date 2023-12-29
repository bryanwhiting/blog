<%*

/// Define the list of folders
const folders = ["book-review", "christianity", "gratitude", "posts"];

// Use the suggester to let the user choose a folder
let folder = await tp.system.suggester(folders, folders);

// Ask for a title
let title = await tp.system.prompt("Post title:");

// Convert title to a slug
let fileNameSlug = title
    .toLowerCase()
    .replace(/[^\w\s-]/g, '') // Remove punctuation
    .trim()
    .replace(/\s+/g, '-'); // Replace spaces with dashes

let slug = await tp.system.prompt("Slug/Filename:", fileNameSlug)

// Get current date
let date = tp.date.now("YYYY-MM-DD");

// Create the file with YAML front matter
let content = `---
title: "${title}"
description: ""
date: "${date}"
categories: ${folder}
draft: false
---

`;

const filepath = `${folder}/${slug}`
await tp.file.move(filepath)
-%><% content %>
