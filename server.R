
library(shiny)

a <- airquality
a$Month <- NULL
a$Day <- NULL
a[is.na(a)] <- 0

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  model <- lm(Temp~Ozone+Solar.R+Wind,data = a)
  
  
   sliderValues <- reactive({
     data.frame(
       QualityValues = c("Ozone",
                  "Solar Radiation",
                  "Wind"),
       Reading = as.character(c(input$ozone,
                              input$solar,
                              input$wind
                              )),
       stringsAsFactors = FALSE)
   })
   
   #Show slider values in table
   output$values <- renderTable({
     sliderValues()
   })
   
   modelPredict <- reactive({
     
     newdata <- data.frame( Ozone = input$ozone,
                            Solar.R = input$solar,
                            Wind = input$wind)  
     
     predict(model,newdata)
     
   })
   
   #Print number of organics based on spend
   output$pred <- renderText({
     modelPredict()
   })
   
   #Print out Model
   output$model <- renderPrint({
     summary(model)
   })
   
   # summary statistics
   output$summary <- renderPrint({
     summary(a)
     
   })
   
   # residuals
   output$residuals_hist <- renderPlot({
     hist(model$residuals, main = "Temp ~ Ozone + Solar + Wind", xlab = 'Residuals') 
   })
  
   output$residuals_qqline <- renderPlot({
     qqnorm(model$residuals)
     qqline(model$residuals) 
   })
   
})
  
  