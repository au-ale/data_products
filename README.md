# data_products
Coursera Week4 Final project

## Shiny App

This app uses data from R datasets: *Airquality* to predict temperature based on three different variables: Ozone, Solar Radiation and Wind.

You can use the app here: 

https://au-ale.shinyapps.io/Regression/

And access the Rpresentation that explains how to use the app here:

http://rpubs.com/au_ale/366228

## ui.R

This file contains the script for the user interface and controls the layout and appearnace of the app. The user interface allows users to select the values for three independent variables: Ozone, Solar Radiation and Wind. 
From the ui you can also navigate through four different tab:
- Main: shows a summary of the variables selected in a table and the predicted temperature
- Regression model: shows the summary of the regression model used in the app
- Data Summary: shows a summary of the three independent variables
- Residuals: shows the residual plots for the regression model

## server.R

The server function contains the instructions that the computer needs to build the app. This file contains various different calculations the app need in order to run - many of these calculations are based off what the user will input into the app e.g. slider values. 
Once the user selects the different variable the server will automatically run the calculations again with the updated variables to display the correct prediction based off the model.
