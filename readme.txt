# Readme

Steps to edit blog on computer
```
# launch docker container:
export GH=/Users/bryanwhiting/github
export ROOT=/home/rstudio

docker run \
	--detach \
	--publish 80:8787 \
	--publish 3000:3000 \
	--env DISABLE_AUTH=true \
	--name renv \
	--volume $GH/blog:$ROOT/blog \
	rocker/tidyverse
	

# after running 
renv::restore()
install.packages('xml2')
install.packages("git2r")
install.packages('downlit')

# Build all files
quarto render 

# Build just listing page
quarto render index.qmd

# Build just files different from remote
Rscript build.R



```
website:
  title: "Bryan Whiting"
  site-url: https://www.bryanwhiting.com
  google-analytics: "UA-85616639-1"
  body-footer: |
    _Bryan is passionate about building great products with data and empowering individuals to reach their potential. Please reach out at <a href="mailto:bryanwhitingcoaching@gmail.com">bryanwhitingcoaching@gmail.com</a> to get mentorship or coaching for your life or business._
  navbar:
    left:
      - text: "Home"
        file: index.qmd
      - about.qmd
      #TODO: enable a header for book notes posts
      #- text: "Book Notes"
      #  file: book-notes/index.qmd
    right:
      - icon: linkedin
        href: "https://www.linkedin.com/in/bryan-whiting/"
      - icon: github
        href: https://github.com/bryanwhiting
      - icon: twitter
        href: "https://twitter.com/bryanwhiting"
      - icon: rss
        href: index.xml
    # (additional metadata excluded for brevity)
  # TODO: this is popping up on every page as "subscribe.html"
  # margin-header: subscribe.html
```