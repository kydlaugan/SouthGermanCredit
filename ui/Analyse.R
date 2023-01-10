nom_colonne <- c("status", "duration", "credit_history", "purpose", "amount", 
                 "savings", "employment_duration", "installment_rate",
                 "personal_status_sex", "other_debtors",
                 "present_residence", "property",
                 "age", "other_installment_plans",
                 "housing", "number_credits",
                 "job", "people_liable", "telephone", "foreign_worker")

Analyse <- div(class="container",
  p(class="text-center text-2xl underline  decoration-sky-500 decoration-double titre","Analyse descriptive des données") ,
  #generation de l'histogramme
  div(class="mx-12",
      selectInput("features","Histogrammes des Attributs:",nom_colonne,width = 300),
      plotOutput("hist")
      ),
  #summary
  div(class="mx-12",
      h1(class="text-center text-xl underline  decoration-sky-500 decoration-double titre"," Vue sommaire des données ") ,br(),
      p(strong("Chaque attribut est representé respectivement par les paramètres de tendance centrale qui sont la médiane et la moyenne , et ensuite les troisieme et premier quartile , le minimun et le maximum  "), .noWS = NULL, .renderHook = NULL),
      br(),
      div(class="test-xs" ,verbatimTextOutput("donne"))
      ), br(),
  
  #boite à moustache
  div(class="mx-12",
      h1(class="text-center text-xl underline  decoration-sky-500 decoration-double titre","Boite à moustache de chaque attribut") , br(),
      selectInput("feature","Boite à moustache" , nom_colonne,width = 300) ,
      strong("Les deux traits horizontaux de la boite sont le 1er et le 3e quartile de l'attribut choisi et le trait fort du milieu représente la médiane qui est de deuxième quartile de l'attribut "),
  strong("Les extrémités des moustaches sont calculeés en utilisant 1.5 fois l'espace inter-quartile,qui est la distance entre le premier et le troisième quartile "),
  plotOutput("dis")  , br(),
      ),
  
  #nuage de point
  div(class="mx-12",
      h1(class="text-center text-xl underline  decoration-sky-500 decoration-double titre","Nuage de Points"),
      div(class="flex flex-row px-4",
          selectInput("feature1"," Entree 1 ",nom_colonne,width = 300),
          selectInput("fit1"," Entree 2 ",nom_colonne,width = 300)
          ),
      plotOutput("ndp" )
      )
)
