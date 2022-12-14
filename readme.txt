# Readme


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