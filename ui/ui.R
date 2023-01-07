source("ui/Acceuil.R")
source('ui/ExtractionRegles.R')
source('ui/JeuDonnees.R')
router <- make_router(
  route("/", Acceuil),
  route("JeuDonnees", JeuDonnees),
  route("ExtractionRegles", ExtractionRegles)
)
ui <- fluidPage( 
    theme = "www/style.css" ,
    tags$ul(
    tags$li(a(href = route_link("/"), "Acceuil")),
    tags$li(a(href = route_link("JeuDonnees"), "JeuDonnees")),
    tags$li(a(href = route_link("ExtractionRegles"), "ExtractionRegles"))
  ),
  router$ui
)