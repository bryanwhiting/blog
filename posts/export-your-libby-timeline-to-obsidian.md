---
title: Export your Libby Timeline to Obsidian
description: Download the Libby timeline, export to markdown files using pandas
date: 2024-02-01 14:32:35
created: 2024-02-01 14:32:35
categories:
  - posts
  - tutorial
  - python
  - libby
  - quarto
  - blogging
draft: false
---
I love reading and I love writing. Both are integral parts of learning. The reading to receive new ideas, the writing to cement those ideas to something. 

As I stood up my blog I wondered how to get past books on here. There's a way!

I now use Audible and Spotify audiobooks, but most of my past reads come from Libby.

![Libby](../img/photo-libby-icon.jpeg){.preview-image}

Here's how you do it using Python:

1. Open Libby app and figure out how to export your timeline. Somewhere in settings. It'll produce a CSV. 
2. Go through that CSV and creat a column "read" that identified the ones you actually began (sigh...so many books I placed holds on but never read....)
3. Run this python script and it'll create an obsidian markdown file for each. Tweak it to match your preferences. I personally use `quarto` to blog so I have a naming convention for the files and metadata. 
4. Or! Just ask ChatGPT to do this for you lol. 


```
from datetime import datetime, timedelta
import pandas as pd
import os
import zipfile
import re

# Load the provided spreadsheet using pandas
file_path = "~/Downloads/libbytimeline-activities.csv"
df = pd.read_csv(file_path)

# Parse the timestamp into the format yyyy-mm-dd and rename the column to 'date'
df["timestamp_raw"] = df["timestamp"]
df["timestamp"] = pd.to_datetime(df["timestamp"], format="%m/%d/%y %H:%M")
# create a stringed date
df["date"] = df["timestamp"].dt.strftime("%Y-%m-%d")

df[["date", "timestamp_raw"]]

# Custom column: Filter rows where read == 1 (went through spreadsheet to filter out those I had borrowed but never read).
df = df[df["read"] == 1]

# De-duplicate by title, keeping the most recent record (sorted by date)
df = df.sort_values("timestamp", ascending=False).drop_duplicates("title")

# Create a new column 'created' with today's date in yyyy-mm-dd format
today = datetime.now().strftime("%Y-%m-%d")
df["created"] = today

# Create a new column 'date-finished' that's the timestamp's date + 21 days
df["date-finished"] = (df["timestamp"] + timedelta(days=21)).dt.strftime("%Y-%m-%d")

# Prepare for markdown file creation
output_directory = os.path.expanduser("~/Desktop/markdown_files")
os.makedirs(output_directory, exist_ok=True)

# Loop through each item in the dataframe and create a markdown file
for index, row in df.iterrows():
    markdown_content = f"""
---
title: {row['title']}
description: _{row['title']}_ by {row['author']}. Published by {row['publisher']}, with ISBN {row['isbn']}. Read on {row['date']}
date: {row['date']}
categories: book-review
created: {row['created']}
draft: false
author: {row['author']}
book-year: 1000
book-time: 0
date-start: {row['date']}
date-finished: {row['date-finished']}
pct-complete: 0
---

![]({row['cover']}){{.preview-image}}
"""
    filename = re.sub(r"[^\w]", "-", row["title"]).lower()
    filename = re.sub(r"-+", "-", filename)
    file_path = os.path.join(output_directory, f"{filename}.md")
    with open(file_path, "w") as file:
        file.write(markdown_content.strip())
    print(f"Created {file_path}")

# Zip the markdown files
zip_file_path = os.path.expanduser("~/Desktop/markdown_files.zip")
with zipfile.ZipFile(zip_file_path, "w") as zipf:
    for root, dirs, files in os.walk(output_directory):
        for file in files:
            zipf.write(os.path.join(root, file), file)
```
