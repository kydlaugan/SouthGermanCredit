source("ui/Acceuil.R")
source('ui/ExtractionRegles.R')
source('ui/Analyse.R')
source('ui/ClassSuper.R')
router <- make_router(
  route("/", Acceuil),
  route("Analyse", Analyse),
  route("ExtractionRegles", ExtractionRegles),
  route("ClassSuper", ClassSuper)
  
)
ui <- div( class="bg-transparent" ,
           includeCSS("www/style.css"),
    tags$ul(class="flex flex-row space-x-11 font-mono text-base bg-blue-700 " ,
    tags$li(class =" m-2" , a(class ="p-0 text-white  " ,href = route_link("/"), "Acceuil")),
    tags$li(class =" m-2" ,a(class ="p-0 text-white " ,href = route_link("Analyse"), "Analyse")),
    tags$li(class ="m-2" ,a(class ="p-0 text-white " ,href = route_link("ExtractionRegles"), "ExtractionRegles")) ,
    tags$li(class ="m-2" ,a(class ="p-0 text-white " ,href = route_link("ClassSuper"), "ClassSuper"))
    
  ) ,
  router$ui ,
  tags$script(src = "https://cdn.tailwindcss.com")
)