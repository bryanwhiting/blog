# goals.R
library(dplyr)
library(ggplot2)
library(purrr)
library(tidyr)
library(gt)
library(lubridate)
library(stringr)

################################################################
# Datasets
################################################################

bool_cols = c('sun', 'sss', 'water24oz', 'pray', 'meditate')
num_cols = c(
    "workout-time",
    "difficulty",
    "pelo-warmup",
    "pelo-time",
    "pelo-kj",
    "pelo-avg",
    "run-dist",
    "run-time",
    "hike-dist",
    "hike-elev",
    "hike-time",
    "basketball-time"
)
list_cols = c(
    "muscle-groups", 
    "exercises",
    "categories"
)
str_cols = c(
    "title",
    "description",
    "workout-vibe",
    "workout-notes",
    "date",
    "updated",
    "created"
)

extract_yaml_to_df <- function(file) {
  # file = "christianity/three-little-pigs-christ.md"  
  # cat("Reading file", file)
  file_content <- readLines(file)
  yaml_lines <- grep("---", file_content)
  yaml_start <- yaml_lines[1] + 1
  yaml_end <- yaml_lines[2] - 1
  # yaml content
  yaml_list <- file_content[(yaml_start):(yaml_end)]
  yaml_text = paste(yaml_list, collapse = "\n")
  yaml_data <- yaml::read_yaml(text=yaml_text)
  yaml_data
  # Anything that's a vector should be listed and collapsed
  list_fields <- names(yaml_data)[sapply(yaml_data, function(x) is.vector(x) && length(x) > 1)]
  for(field in list_fields){
    yaml_data[field] = paste(unlist(yaml_data[field]), collapse=", ")
  }
  for(field in names(yaml_data)){
    # missing yaml data columns get set to False
    if(is.null(yaml_data[[field]])){
      yaml_data[[field]] <- NA
    }
    if(field %in% bool_cols){
      yaml_data[[field]] <- as.logical(yaml_data[[field]])
    }
    if(field %in% num_cols){
      yaml_data[[field]] <- as.numeric(yaml_data[[field]])
    }
  }

  result <- try({
    df <- tibble::as_tibble(yaml_data)
  })

  if (inherits(result, "try-error")) {
    cat("Error in file:", file, "\n")
  }

  return(df)
}

# add gratitude
dirs <- c('goals', 'gratitude', "christianity")
df_raw <- tibble::tibble()
for(dir in dirs){
  files <- list.files(path = dir, pattern = "*.md", full.names = TRUE)
  for(file in files){
    # print(file)
    # convert to df
    df_new <- extract_yaml_to_df(file) 
    df_new$folder = dir
    df_raw <- bind_rows(df_raw, df_new)
  }
}

# add missing columsn
for(col in c('run-dist', 'hike-dist', 'jumprope-time')){
  if(!(col %in% colnames(df))){
    df_raw[[col]] <- 0
  }
}

# fill in missing defaults, characters are set to 'x' by default in _day journal
df_raw <- df_raw %>%
  mutate(
    # Turn 'x' into NA
    across(where(is.character), ~ifelse(. == 'x', NA, .)),
    # parse just the date from datetime/date formats
    date = as.Date(lubridate::parse_date_time(date, orders = c("ymd", "ymd HMS", "ymd HM", "ymdHMS", "ymdHM"))),
    # create some flags
    post_cfm_study = stringr::str_detect(categories, 'come follow me'),
    post_gratitude = folder == 'gratitude',
    pelo = ifelse(`pelo-time` > 0, 1, 0),
    cardio = ifelse(
        `pelo-time` > 0 | 
        `run-dist` > 0 | 
        `hike-dist` > 0 | 
        `jumprope-time` > 0 |
        `basketball-time` > 0 
        , 1, 0),
    strength = ifelse(!is.na(exercises) >= 1, 1, 0)
  ) %>%
  filter(title != "test")


################################################################
# Datasets
################################################################
# df_daily_goals_only = daily df
n_goals = 9
df_daily_goals_only <- df_raw %>%
  select(
    date, pray, meditate, cardio, strength, post_cfm_study, post_gratitude, sun, sss, water24oz
  ) %>% 
  mutate(across(-date, as.numeric)) %>%
  mutate(across(-date, ~replace_na(., 0))) %>%
  group_by(date) %>%
  summarize_all(max) %>%
  ungroup() %>%
  arrange(desc(date)) %>% 
  # sum the goals
  rowwise() %>%
  mutate(total_goals = sum(pray, meditate, strength, cardio, post_cfm_study, post_gratitude, sun, sss, water24oz)) %>%
  ungroup()


df_yearly_calendar <- bind_rows(data.frame(date = seq(as.Date("2024-01-01"), as.Date("2024-12-31"), by = "days"))) %>%
  mutate(day_of_month = lubridate::day(date)) %>%
  mutate(month_type = ifelse(lubridate::month(date) %% 2 == 0, 1, 0))

df_date_goalcnt <- df_daily_goals_only %>%
  select(date, total_goals) 

# Used for ggplot
df_plt_github_daily_habits <- left_join(df_yearly_calendar, df_date_goalcnt, by = 'date') %>%
  mutate(
    week_start_date = floor_date(date, "week"),
    day_of_week = wday(date, label = TRUE)
  ) %>%
  mutate(total_goals = replace_na(total_goals, 0))


df_daily_goals_only_recent <- df_daily_goals_only %>% 
  arrange(desc(date)) %>%
  head(15) %>%
  mutate(
    # %e = non zero-padded day
    date = glue::glue("{wday(date, label=T)} {month(date)}/{day(date)}")
  ) %>%
  select(
    `Day` = date,
    `☀️` = sun,
    `💧` = water24oz,
    `📖` = post_cfm_study,
    `🙏🏻` = post_gratitude,
    `🚴🏻` = cardio,
    `🏋🏼‍♂️` = strength,
    `🧘🏼‍♂️` = meditate,
    `🛐` = pray,
    `🔗` = sss
  ) 

# Assuming your data frame is named 'data'
# First, convert the 'Day' column to the desired format


# Peloton records
df_pelo_records <- df_raw %>% 
  filter(pelo == 1) %>%
  filter(date >= Sys.Date() - 60) %>%
  group_by(`pelo-time`) %>%
  filter(`pelo-kj` == max(`pelo-kj`)) %>%
  select(`pelo-time`, `pelo-kj`, `pelo-avg`, date, `workout-notes`) %>%
  ungroup() %>%
  mutate(`90%` = paste0("", .9 * `pelo-kj`, "KJ\n(", .9 * `pelo-avg`, "avg)")) %>%
  mutate(`80%` = paste0("", .8 * `pelo-kj`, "KJ (", .8 * `pelo-avg`, "avg)")) %>%
  mutate(`70%` = paste0("", .7 * `pelo-kj`, "KJ (", .7 * `pelo-avg`, "avg)"))



################################################################
# ARTIFACTS
################################################################

plt_github_daily_habits <- ggplot(df_plt_github_daily_habits, aes(x = week_start_date, y = day_of_week)) +
  theme_minimal() +
  # background shading - nearly works.
  geom_tile(aes(fill=as.factor(month_type)), show.legend = FALSE) + 
  scale_fill_manual(values = c("white", "lightgray")) +
  geom_point(data=df_plt_github_daily_habits, aes(color = total_goals), shape=15, size=2) +
  scale_color_gradient2(low = "white", high = "darkgreen", limits = c(0, 9), breaks = 0:9) +
  # add titles for goals
  # geom_tile(data=df_plt_github_daily_habits, aes(fill = total_goals), color = "white", width = 5, height = 0.9) + 
#   scale_color_gradient2(low = "white", high = "darkgreen", limits = c(0, 9), breaks = 0:9) +
  labs(x = "", y = "", color='', title = "Success Rate for Nine Essential Daily Habits") +
  scale_x_date(limits = as.Date(c("2023-12-25", "2024-12-31")), labels = scales::date_format("%b")) +
  scale_y_discrete(limits = rev(levels(df_plt_github_daily_habits$day_of_week))) +
  theme(axis.text.x = element_text(angle = 0, hjust = 0),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        axis.ticks = element_blank())

# Generate a sequence of dates for a year
start_date <- ymd("2023-01-01")
end_date <- ymd("2023-12-31")
dates <- seq.Date(start_date, end_date, by = "day")

# Create a data frame
data <- data.frame(date = dates)

# Extract week of the year and month
data$week <- isoweek(data$date)
data$month <- month(data$date)

# Determine shading color based on the month
data$color <- ifelse(data$month %% 2 == 0, "lightgray", "white")

# Plotting
ggplot(data, aes(xmin = week - 0.5, xmax = week + 0.5, ymin = date - 0.5, ymax = date + 0.5, fill = factor(color))) +
  geom_rect() +
  scale_fill_manual(values = c("lightgray" = "lightgray", "white" = "white")) +
  theme_minimal() +
  labs(x = "Week of the Year", y = "Date", fill = "Month") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

tab_l15_daily_habits <- df_daily_goals_only_recent %>%
  gt(id='mygt', rowname_col = "Day") %>%
  data_color(
    method = "numeric",
    palette = c("white", "darkgreen"),
    domain = c(0, 1)
  ) %>%
  tab_header(
    title = "Daily Habits"
  ) |>
  tab_style(
    style = list(
      cell_text(color = "transparent")
    ),
    locations = cells_body(
      columns = c(2:(n_goals + 1))  # replace with the actual column indices or names
    )
  ) %>%
  cols_align(align = "center") %>%
  tab_style(
    style = cell_borders(sides = "right", color = "white", weight = px(1)),
    locations = cells_body(columns = everything())
  ) %>%
  cols_width(
    Day ~ px(100),
    everything() ~ px(40),
  ) %>%
  tab_source_note(
    md("📖: Study, 🙏🏻: Gratitude, 🛐: Pray, 🚴🏻‍♂️: Cardio, 🏋🏼‍♂️: Strength, 🧘🏼‍♂️: Meditate")
  )


#' Peloton Records
#' 
tab_pelo_records <- df_pelo_records %>%
 gt() %>%
  cols_width(
    `90%` ~ px(70),
    `80%` ~ px(70),
    `70%` ~ px(70),
    # everything() ~ px(150),
  ) %>%
  cols_label(
    `pelo-time` = "Time",
    `pelo-kj` = "KJ",
    `pelo-avg` = "Avg W",
    `workout-notes` = "Notes",
    `date` = "Day"
  ) %>%
  tab_header(title = "Bike Records")