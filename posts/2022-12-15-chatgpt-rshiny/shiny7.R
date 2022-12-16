# Install and load the necessary libraries
# install.packages("prophet")
# install.packages("quantmod")
# install.packages("xts")
library(quantmod)
library(shiny)
library(prophet)
library(tidyverse)
library(dygraphs)
library(xts)

# Read in the stock prices for AAPL
getSymbols("AAPL")
aapl <- as.data.frame(AAPL)

# Convert the rowname (date information) into a column
aapl <- rownames_to_column(aapl, "date")

# Select the necessary columns and rename them
aapl <- aapl %>% select(date, AAPL.Adjusted) %>% rename(y = AAPL.Adjusted, ds = date)
aapl$ds <- as.Date(aapl$ds)

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
    aapl2 <- aapl[input$window[1]:input$window[2],]
    # https://stackoverflow.com/questions/4297231/converting-a-data-frame-to-xts
    aapl2 <- as.xts(aapl2[, -1], aapl2[, 1])
    forecast_subset <- forecast %>% select(ds, yhat) %>% 
        filter(ds >= "2022-12-15")
    aapl2 <- bind_rows(aapl2, forecast_subset)
    aapl2$indicator <- ifelse(aapl2$ds > max(aapl$ds), 1, 0)
    
    return(aapl2)
  })
  
  # Render the dygraphs plot
  output$plot <- renderDygraph({
    dygraph(stock_subset(), main = "AAPL Stock Price", group='indicator') %>%
      dySeries(color = color_with_gradient(c("#0000FF", "#FFFFFF", "#FF0000"))) %>%
      dyRangeSelector()
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)