source("ui/Acceuil.R")
source('ui/ExtractionRegles.R')
source('ui/Analyse.R')
source('ui/ClassSuper.R')
source('ui/ClassNonSuper.R')
router <- make_router(
  route("/", Acceuil),
  route("Analyse", Analyse),
  route("ExtractionRegles", ExtractionRegles),
  route("ClassSuper", ClassSuper),
  route("ClassNonSuper", ClassNonSuper)
  
  
)
ui <- div( class="bg-transparent" ,
           includeCSS("www/style.css"),
    tags$ul(class="flex flex-row space-x-11 font-mono text-base bg-blue-700 text-2xl" ,
    tags$li(class =" m-2 p-5" , a(class ="p-4 text-white text-2xl " ,href = route_link("/"), "Acceuil")),
    tags$li(class =" m-2 p-5" ,a(class ="p-4 text-white text-2xl" ,href = route_link("Analyse"), "Analyse")),
    tags$li(class ="m-2 p-5" ,a(class ="p-4 text-white  text-2xl" ,href = route_link("ExtractionRegles"), "ExtractionRegles")) ,
    tags$li(class ="m-2 p-5" ,a(class ="p-4 text-white  text-2xl" ,href = route_link("ClassSuper"), "ClassSuper")) ,
    tags$li(class ="m-2 p-5" ,a(class ="p-4 text-white  text-2xl" ,href = route_link("ClassNonSuper"), "ClassNonSuper"))
    
    
  ) ,
  router$ui ,
  tags$script(src = "https://cdn.tailwindcss.com")
)