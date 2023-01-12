ClassNonSuper <- div(class="cointainer" ,
                     #methode des segmentations
                     p(class="text-center text-2xl underline  decoration-sky-500 decoration-double titre mt-8","Methode des Kmeans"),
                     div(class="mx-12 flex flex-row mt-4",
                         div(class="flex flex-row px-4 basis-1/2",
                             div(class="bg-sky-500/50",
                                 selectInput("n_cluster","Nombre de clusters",c(2:10),width = 300),
                                 strong("La figure ci-dessous représente le classement non supervisé de 1000 donneés en le nombre de clusters choisi.Chaque cluster représente un groupe.
                                          La classification non supervisée permet de regrouper des données non etiquetées en groupes en se servant des distances qui existent entre eux pour les classer. ")
                             )
                         ),
                         div(class="basis-1/2",
                             plotOutput("cl")
                         )
                     ),
                     )