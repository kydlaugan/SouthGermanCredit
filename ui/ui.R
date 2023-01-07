source("ui/Acceuil.R")
source('ui/ExtractionRegles.R')
source('ui/JeuDonnees.R')
router <- make_router(
  route("/", Acceuil),
  route("JeuDonnees", JeuDonnees),
  route("ExtractionRegles", ExtractionRegles)
)
ui <- div( class="bg-transparent" ,
           includeCSS("www/style.css"),
    tags$ul(class="flex flex-row space-x-11 font-mono text-base bg-blue-700 " ,
    tags$li(class =" m-2" , a(class ="p-0 text-white  " ,href = route_link("/"), "Acceuil")),
    tags$li(class =" m-2" ,a(class ="p-0 text-white " ,href = route_link("JeuDonnees"), "JeuDonnees")),
    tags$li(class ="m-2" ,a(class ="p-0 text-white " ,href = route_link("ExtractionRegles"), "ExtractionRegles"))
    
  ) ,
  router$ui ,
  tags$script(src = "https://cdn.tailwindcss.com")
)