library(bslib)
library(shiny)
library(shiny.router)
library(bsicons)
library(dplyr)
library(arules)
#chargement de l'interface
source("ui/ui.R")  
#chargement du server
source("server/server.R")

# Run the application 
shinyApp(ui = ui, server = server)
