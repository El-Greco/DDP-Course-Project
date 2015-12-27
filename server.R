# server.R
library(shiny)
library(quantmod)

shinyServer(function(input, output) {
  
  dataInput <- reactive({
    
    symbol <- switch(input$symb, 
                   "US Index(S&P)" = "SPY",
                   "UK Index(FTSE)" = "^FTSE",
                   "German Index(DAX)" = "^GDAXI",
                   "French Index(CAC)" = "^FCHI",
                   "EUR/USD" = "EUR/USD",
                   "GBP/USD" = "GBP/USD",
                   "AUD/USD" = "AUD/USD",
                   "CAD/USD" = "CAD/USD",
                   "Gold" = "XAU/USD",
                   "Silver" = "XAG/USD",
                   "Platinum" = "XPT/USD")
    
    srch <- switch(input$symb, 
                     "US Index(S&P)" = "yahoo",
                     "UK Index(FTSE)" = "yahoo",
                     "German Index(DAX)" = "yahoo",
                     "French Index(CAC)" = "yahoo",
                     "EUR/USD" = "oanda",
                     "GBP/USD" = "oanda",
                     "AUD/USD" = "oanda",
                     "CAD/USD" = "oanda",
                     "Gold" = "oanda",
                     "Silver" = "oanda",
                     "Platinum" = "oanda")
    
    getSymbols(Symbols = symbol, src = srch, 
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
  })
  
  PriceSeries <- reactive({
    if (!input$toweekly) return(dataInput())
    to.weekly(dataInput())
  })
  
  output$plot <- renderPlot({
    chartSeries(PriceSeries(), theme = chartTheme("white"), 
                type = "bars", log.scale = input$log, TA = list(input$TA1, input$TA2, input$TA3, input$TA4))
  })
})