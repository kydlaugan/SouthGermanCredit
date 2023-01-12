ClassSuper <- div(class="container",
                  #arbre de decision
                  p(class="text-center text-2xl underline  decoration-sky-500 decoration-double titre","Arbre de Décision"),
                  div(class="flex flex-row text-xl",
                         plotOutput("decision" , height=800),
                      ),
                  div(class="flex flex-row justify-center ",
                      div(class="basis-full text-xs text-center",
                          verbatimTextOutput("confusion1"),
                          ),
                  ),
                  
                  #réseau de neuronnes
                  p(class="text-center text-2xl underline  decoration-sky-500 decoration-double titre","Réseau de neuronne"),
                  div(class="mx-12 flex flex-row mt-8",
                      div(class="basis-1/2",
                          imageOutput("neuronne"),
                          ) ,
                      div(class="basis_1/2",
                          p(classs="mt-4","matrice de confusion")
                          )
                      ),
                  
                  
                  #methodes des k plus proches voisins
                  p(class="text-center text-2xl underline  decoration-sky-500 decoration-double titre mt-8","Methode des K plus proches voisins"),
                div(class="mx-12 flex flex-row mt-4",
                    div(class="flex flex-row px-4 basis-1/2",
                        div(class="bg-sky-500/50",
                        textInput("txt1"," Entree 1 ","",width = 300),
                        textInput("txt2"," Entree 2 ","",width = 300),
                        actionButton(inputId = "id_action", label = "Ok !",
                        icon = icon("refresh"))
                  )
                    ),
                  div(class="basis-1/2",
                      plotOutput("kppv" )
                      )
                  ),
                  
                #methome des svm
                p(class="text-center text-2xl underline  decoration-sky-500 decoration-double titre mt-8","Methode des SVM"),
                div(class="flex mt-8 justify-center ",
                    div(class="basis-full text-xs text-center",
                        verbatimTextOutput("confusion2"),
                    ),
                ),
                
                #réseau bayésien naif
                p(class="text-center text-2xl underline  decoration-sky-500 decoration-double titre mt-8","Reseau Bayésien naif"),
                div(class="flex mt-8 justify-center ",
                    div(class="basis-full text-xs text-center",
                        verbatimTextOutput("confusion3"),
                    ),
                ),
                
                
                  
)