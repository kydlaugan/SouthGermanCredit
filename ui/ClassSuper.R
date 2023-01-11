ClassSuper <- div(class="container",
                  p(class="text-center text-2xl underline  decoration-sky-500 decoration-double titre","Arbre de Décision"),
                  div(class="flex flex-row text-xl",
                         plotOutput("decision" , height=800),
                      ),
                  div(class="flex flex-row",
                      div(class="basis-1/2",
                          verbatimTextOutput("confusion1"),
                          ),
                      div(class="basis-1/2",
                          p("Nous avons une Precision de   " , textOutput("precision1"), "pour les mauvais Credit_risk ce qui signifie que  ", textOutput("precision1_1") ,"des cas prédits par le modèle ont effectivement été jugé comme mauvais Credit_risk"),
                          p("Nous avons une Precision de   " , textOutput("precision2"), "pour les bons Credit_risk ce qui signifie que  ", textOutput("precision2_2") ,"des cas prédits par le modèle ont effectivement été jugé comme bons Credit_risk"),
                          p("C'est donc dire que  " , textOutput("rappel1"), "des cas de mauvais crédit ont été prédit avec pecision"),
                          p("C'est donc dire que  " , textOutput("rappel2"), "des cas de bons crédit ont été prédit avec precision"),
                          
                      ),
                  )
                  
)