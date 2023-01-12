library(bslib)
library(shiny)
library(shiny.router)
library(bsicons)
library(dplyr)
library(arules)
library(rpart)
library(rpart.plot)
library(gmodels)
library(class)
library(ggplot2)
library(gridExtra)
library(factoextra)
library(neuralnet)
library(e1071)
#chargement de l'interface
source("ui/ui.R")  
#chargement du server
source("server/server.R")

# Run the application 
shinyApp(ui = ui, server = server)
