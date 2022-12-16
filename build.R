library(dplyr)
library(stringr)
files <- system("git diff main origin/main --name-only -- . :^docs", intern=T) %>% 
    tibble(files=.) %>% 
    filter(str_detect(files, 'md$')) %>% 
    pull(files)

if(length(files) > 0){
  cat(
    paste0('Rendering uncommitted *.md files:\n\t', 
           paste0(files, collapse ="\n\t")
    ), 
  "\n")
  for(f in files){
    cmd <- paste0("quarto render --quiet ", f)
    print(cmd)
    system(cmd)
  }
}
