Acceuil <- div(
           div(class = "flex flex-row acceuil",
               div(class = "basis-1/2 mt-32 ",
                   p(class = "ml-10 text-2xl text-sky-700",
                     "Analyse Credit Risque" ),
                    p(class="ml-10 mt-3 text-2xl text-sky-700" ,
                      "De La Banque D'Allemagne Du Sud"),
                   h3(class = "ml-10 mt-5" ,
                     "Lorsqu'une banque reçoit une demande de prêt, en fonction du profil du demandeur, la banque doit prendre une décision quant à l'approbation ou non du prêt. Deux types de risques sont associés à la décision de la banque :"),
                   tags$ul(class = "ml-10",
                     tags$li("Si le demandeur présente un bon risque de crédit, c'est-à-dire qu'il est susceptible de rembourser le prêt, le fait de ne pas approuver le prêt à la personne entraîne une perte d'activité pour la banque"),
                     tags$li("Si le demandeur est un mauvais risque de crédit, c'est-à-dire qu'il est peu probable qu'il rembourse le prêt, l'approbation du prêt à la personne entraîne une perte financière pour la banque" )
                   ), 
                   div(class="flex justify-center ",
                       tags$button(class="bg-blue-500 shadow-lg shadow-blue-500/50 mt-28 ml-36 p-4 rounded-full hover:bg-sky-700 text-white",
                                   "Apprendre Plus")
                       )
                  
                   ),
               
               div(class="basis-1/2 mt-24" ,
                   imageOutput('bank1')),
               ),
           div(class="mt-48" ,
             p(class="text-center text-2xl underline  decoration-sky-500 decoration-double titre","Jeu De Données Initiales")
           ),
           br(),br(),
           
          div(class="mx-12" ,DT::dataTableOutput("table")),
          br(),br(),
          #box pour lister les effectifs
          div(class="flex justify-between  mx-12",
              tags$button(class="bg-blue-500 shadow-lg shadow-blue-500/50  p-4  hover:bg-sky-700 text-white rounded-lg shadow-2xl drop-shadow-2xl shadow-cyan-500/50 animate-bounce",
                          p( class="titre text-4xl m-8","21"),"Attributs"),
              tags$button(class="bg-blue-500 shadow-lg shadow-blue-500/50  p-4  hover:bg-sky-700 text-white rounded-lg shadow-2xl drop-shadow-2xl shadow-cyan-500/50 animate-bounce",
                          p( class="titre text-4xl m-8","1,000"),"Valeurs Par Attributs"),
              tags$button(class="bg-blue-500 shadow-lg shadow-blue-500/50  p-4  hover:bg-sky-700 text-white rounded-lg shadow-2xl drop-shadow-2xl shadow-cyan-500/50 animate-bounce",
                          p( class="titre text-4xl m-8", "0",textOutput("manq")),"Valeurs Manquantes")
          ) ,
          div(class="mt-24" ,
              p(class="text-center text-2xl underline  decoration-sky-500 decoration-double titre","Données Discretisées")
          ),
          div(class="mx-12 text-sm" ,DT::dataTableOutput("tables")),
          
          
)

