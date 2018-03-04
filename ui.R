

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Air Quality Analysis"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("ozone",
                   "Ozone parts per Billion:",
                   min = 1,
                   max = 200,
                   value = 20),
      sliderInput("solar",
                  "Solar Radiation:",
                  min = 1,
                  max = 300,
                  value = 50),
      sliderInput("wind",
                  "Average Wind Speed:",
                  min = 1,
                  max = 25,
                  value = 10)
    ),
    
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("Prediction:",
                           h3("Your Input"),
                           tableOutput("values"),
                           h3("Predicted Temperature (F)"),
                           verbatimTextOutput("pred")),
                  tabPanel("Regression Model",
                           verbatimTextOutput("model")),
                  tabPanel("Data Summary",
                           verbatimTextOutput("summary")),
                  tabPanel("residuals",
                           plotOutput("residuals_hist"),
                           plotOutput("residuals_qqline"))
      )))))
