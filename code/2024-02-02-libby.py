from datetime import datetime, timedelta
import pandas as pd
import os
import zipfile
import re

date_format = "%B %d, %Y %H:%M"
# date_format = "%m/%d/%y %H:%M"

# Load the provided spreadsheet using pandas
file_path = "~/Downloads/libbytimeline-activities.csv"
df = pd.read_csv(file_path)

# Parse the timestamp into the format yyyy-mm-dd and rename the column to 'date'
df["timestamp_raw"] = df["timestamp"]
df["timestamp"] = pd.to_datetime(df["timestamp"], format=date_format)
# create a stringed date
df["date"] = df["timestamp"].dt.strftime("%Y-%m-%d")

df[["date", "timestamp_raw"]]

# Custom column: Filter rows where read == 1 (went through spreadsheet to filter out those I had borrowed but never read).
#df = df[df["read"] == 1]

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
