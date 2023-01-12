ExtractionRegles <- div( class="text-xl mt-6",
                         pageWithSidebar(               
    headerPanel("Regle d'association"),
    
    sidebarPanel(
      
      conditionalPanel(
        condition = "input.samp=='quelque'",
        numericInput("nrule", 'Number of Rules', 5), br()
      ),
      
      conditionalPanel(
        condition = "input.mytab %in%' c(, 'table', 'datatable', 'itemFreq')", 
        radioButtons('samp', label='Sample', choices=c('Toutes les regles', 'Simple'), inline=T), br(),
        uiOutput("choose_columns"), br(),
        sliderInput("supp", "Support:", min = 0, max = 1, value = 0.6, step = 1/10000), br(),
        sliderInput("conf", "Confidence:", min = 0, max = 1, value = 0.8 , step = 1/10000), br(),
        selectInput('sort', label='Sorting Criteria:', choices = c('lift', 'confidence', 'support')), br(), br(),
        numericInput("minL", "Min. items per set:", 2), br(), 
        numericInput("maxL", "Max. items per set:", 3), br(),
      )
      
    ),
    
    mainPanel(
      tabsetPanel(id='mytab',
                  tabPanel('Table', value='table', verbatimTextOutput("rulesTable")),
                  tabPanel('Data Table', value='datatable', dataTableOutput("rulesDataTable")),
                  tabPanel('ItemFreq', value='itemFreq', plotOutput("itemFreqPlot", width='100%', height='100%')),
                  tabPanel('rulesPertinante', value='rulesPertinante', verbatimTextOutput("rulesPertinante"))
      )
    )
    
))