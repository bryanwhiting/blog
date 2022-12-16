# Install and load the necessary libraries
# install.packages("prophet")
library(shiny)
library(prophet)
library(tidyverse)
library(dygraphs)

# Read in the stock prices for AAPL
getSymbols("AAPL")
aapl <- as.data.frame(AAPL)
aapl <- aapl %>% select(date, Adj) %>% rename(y = Adj, ds = date)

# Fit a model to the stock price data
m <- prophet(aapl)

# Forecast the stock price 6 months into the future
future <- make_future_dataframe(m, periods = 180)
forecast <- predict(m, future)

# Define the user interface
ui <- fluidPage(
  
  # Add a slider input widget
  sliderInput("window", "Time Period:",
              min = 1, max = length(aapl$y), value = c(1, length(aapl$y)), step = 1),
  
  # Add a dygraphs plot
  dygraphOutput("plot")
)

# Define the server function
server <- function(input, output) {
  
  # Reactive expression to create a subset of the data based on the slider input
  stock_subset <- reactive({
    aapl[input$window[1]:input$window[2],]
  })
  
  # Render the dygraphs plot
  output$plot <- renderDygraph({
    dygraph(stock_subset(), main = "AAPL Stock Price") %>%
      dyRangeSelector()
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)