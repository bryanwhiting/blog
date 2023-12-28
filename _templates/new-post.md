<%*

/// Define the list of folders
const folders = ["book-reviews", "christianity", "gratitude", "posts"];

// Use the suggester to let the user choose a folder
let folder = await tp.system.suggester(folders, folders);

// Ask for file name and process it
let fileNameRaw = await tp.system.prompt("Enter file name:");
let fileNameSlug = fileNameRaw
    .toLowerCase()
    .replace(/[^\w\s-]/g, '') // Remove punctuation
    .trim()
    .replace(/\s+/g, '-'); // Replace spaces with dashes

// Ask for a title
let title = await tp.system.prompt("Enter title:");

// Get current date
let date = tp.date.now("YYYY-MM-DD");

// Create the file with YAML front matter
let content = `---
title: "${title}"
description: ""
date: "${date}"
draft: false
---

`;

tp.file.rename(`${folder}/${fileNameSlug}.md`);
%>