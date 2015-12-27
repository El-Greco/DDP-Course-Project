library(shiny)
library(quantmod)

shinyUI(fluidPage(
  title = "marketVis",
  
  plotOutput("plot"),
  
  hr(),
  
  fluidRow(
    column(4,
           helpText("This", strong("Shiny App"), "is based on", strong("Lesson 6"),
                    "of the online tutorial which can be found on the",
                    strong("RStudio")," website,",  a("here.", href=("http://shiny.rstudio.com/tutorial/lesson6/")),
                    "It downloads daily price data for a number of different markets. Information for Stock Market Indices will be collected from Yahoo Finance. 
                    Information for Currencies and Precious Metals will be collected from Oanda. Please choose  a Market to examine."),
           
           selectInput("symb", 
                  label = "Market",
                  choices = c("US Index(S&P)", "UK Index(FTSE)", "German Index(DAX)", "French Index(CAC)",
                              "EUR/USD", "GBP/USD", "AUD/USD", "CAD/USD", "Gold", "Silver", "Platinum"),
                  selected = "S&P Index"),
           br(),
           helpText("Please select the time period you are interested in."),
           dateRangeInput("dates", 
        "Date range",
        start = "2014-01-01", 
        end = as.character(Sys.Date()))
           
           ),
    
    column(4,
           helpText("If you wish, you can perform some technical analysis and add up to four", 
                    strong("Technical Indicators"), "using the drop-down menus below. Please first use",
                    em("Technical Indicator 1"), "then", em("Technical Indicator 2"), "and so on."),
           
           selectInput("TA1",
                  "Technical Indicator 1", 
                  choices = list("None" = "NULL", "Average True Range" = "addATR()", "Bollinger Bands" = "addBBands()", 
                                 "Commodity Channel Index" = "addCCI()", "Detrended Price Oscillator" = "addDPO()",
                                 "Exponential Moving Average" = "addEMA()", "Price Envelope" = "addEnvelope()",
                                 "MACD" = "addMACD()", "Momentum" = "addMomentum()", "Rate of Change" = "addROC()",
                                 "Realtive Strength Index" = "addRSI()", "Simple Moving Average" = "addSMA()",
                                 "Stochastic Momentum Index" = "addSMI()", "Williams %R" = "addWPR()", "Volume"="addVo()"),
                  selected = "NULL"),
           
           selectInput("TA2",
                  "Technical Indicator 2", 
                  choices = list("None" = "NULL", "Average True Range" = "addATR()", "Bollinger Bands" = "addBBands()", 
                                 "Commodity Channel Index" = "addCCI()", "Detrended Price Oscillator" = "addDPO()",
                                 "Exponential Moving Average" = "addEMA()", "Price Envelope" = "addEnvelope()",
                                 "MACD" = "addMACD()", "Momentum" = "addMomentum()", "Rate of Change" = "addROC()",
                                 "Realtive Strength Index" = "addRSI()", "Simple Moving Average" = "addSMA()",
                                 "Stochastic Momentum Index" = "addSMI()", "Williams %R" = "addWPR()", "Volume"="addVo()"),
                  selected = "NULL"),
           
           selectInput("TA3",
                  "Technical Indicator 3", 
                  choices = list("None" = "NULL", "Average True Range" = "addATR()", "Bollinger Bands" = "addBBands()", 
                                 "Commodity Channel Index" = "addCCI()", "Detrended Price Oscillator" = "addDPO()",
                                 "Exponential Moving Average" = "addEMA()", "Price Envelope" = "addEnvelope()",
                                 "MACD" = "addMACD()", "Momentum" = "addMomentum()", "Rate of Change" = "addROC()",
                                 "Realtive Strength Index" = "addRSI()", "Simple Moving Average" = "addSMA()",
                                 "Stochastic Momentum Index" = "addSMI()", "Williams %R" = "addWPR()", "Volume"="addVo()"),
                  selected = "NULL"),
           
           selectInput("TA4",
                  "Technical Indicator 4", 
                  choices = list("None" = "NULL", "Average True Range" = "addATR()", "Bollinger Bands" = "addBBands()", 
                                 "Commodity Channel Index" = "addCCI()", "Detrended Price Oscillator" = "addDPO()",
                                 "Exponential Moving Average" = "addEMA()", "Price Envelope" = "addEnvelope()",
                                 "MACD" = "addMACD()", "Momentum" = "addMomentum()", "Rate of Change" = "addROC()",
                                 "Realtive Strength Index" = "addRSI()", "Simple Moving Average" = "addSMA()",
                                 "Stochastic Momentum Index" = "addSMI()", "Williams %R" = "addWPR()", "Volume"="addVo()"),
                  selected = "NULL")
           ),
    
    column(4,
           helpText("You can tick the box below if you wish to plot prices in log scale so that egual distances on
                    the Y axis represent equal percentage moves."),
           
           checkboxInput("log", "Plot y axis on log scale", 
                         value = FALSE),
           br(),
           helpText("If you wish to switch timeframe and plot weekly, instead of daily, data you can tick the
                    box below."),
           
           checkboxInput("toweekly", 
                         "Aggregate daily prices to weekly", value = FALSE),
           br(),
           helpText("Finally, you can visit this GitHub page",  a("here", href=("https://github.com/El-Greco/DDP-Course-Project")),
                    "if you wish to see the", span("R code", style = "color:green"), "for this application.")
           
           )
  )
))