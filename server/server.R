server <- function(input , output, session) {
  output$bank1 <- renderImage({
    list(src = "image/money.png",
         width = "100%",
         height = 500)
  }, deleteFile = F)
  #chargement des donnees
  donnee <- read.table("Data_set/SouthGermanCredit/SouthGermanCredit.asc", header=TRUE)
  #renommage des colonnes
  nom_colonne <- c("status", "duration", "credit_history", "purpose", "amount", 
                   "savings", "employment_duration", "installment_rate",
                   "personal_status_sex", "other_debtors",
                   "present_residence", "property",
                   "age", "other_installment_plans",
                   "housing", "number_credits",
                   "job", "people_liable", "telephone", "foreign_worker",
                   "credit_risk")
  names(donnee) <- nom_colonne
  output$table <- DT::renderDataTable(DT::datatable({
    donnee
  })) 
  #recherche des valeurs manquantes
  output$manq <- renderText({
    #compter le nombres de  valeurs manquantes
    nrow(donnee[!complete.cases(donnee),])
  })
  #suppression des attributs
  data <- select(donnee,-c(people_liable,other_installment_plans))
  dat <- donnee
  #discretisation des données
  #renommage des données
  for (i in setdiff(1:21, c(2,4,5,13)))
    dat[[i]] <- factor(dat[[i]])
  
  dat[[4]] <- factor(dat[[4]], levels=as.character(0:10))
  levels(dat$credit_risk) <- c("bad", "good")
  levels(dat$status) = c("no checking account",
                         "... < 0 DM",
                         "0<= ... < 200 DM",
                         "... >= 200 DM / salary for at least 1 year")   
  
  levels(dat$credit_history) <- c(
    "delay in paying off in the past",
    "critical account/other credits elsewhere",
    "no credits taken/all credits paid back duly",
    "existing credits paid back duly till now",
    "all credits at this bank paid back duly")
  
  levels(dat$purpose) <- c(
    "others",
    "car (new)",
    "car (used)",
    "furniture/equipment",
    "radio/television",
    "domestic appliances",
    "repairs",
    "education", 
    "vacation",
    "retraining",
    "business")
  
  levels(dat$savings) <- c("unknown/no savings account",
                           "... <  100 DM", 
                           "100 <= ... <  500 DM",
                           "500 <= ... < 1000 DM", 
                           "... >= 1000 DM")
  levels(dat$employment_duration) <- 
    c(  "unemployed", 
        "< 1 yr", 
        "1 <= ... < 4 yrs",
        "4 <= ... < 7 yrs", 
        ">= 7 yrs")
  
  dat$installment_rate <- ordered(dat$installment_rate)
  levels(dat$installment_rate) <- c(">= 35", 
                                    "25 <= ... < 35",
                                    "20 <= ... < 25", 
                                    "< 20")
  levels(dat$other_debtors) <- c(
    "none",
    "co-applicant",
    "guarantor")
  
  levels(dat$personal_status_sex) <- c(
    "male : divorced/separated",
    "female : non-single or male : single",
    "male : married/widowed",
    "female : single")
  dat$present_residence <- ordered(dat$present_residence)
  levels(dat$present_residence) <- c("< 1 yr", 
                                     "1 <= ... < 4 yrs", 
                                     "4 <= ... < 7 yrs", 
                                     ">= 7 yrs")
  
  levels(dat$property) <- c(
    "unknown / no property",
    "car or other",
    "building soc. savings agr./life insurance", 
    "real estate"
  )
  levels(dat$other_installment_plans) <- c(
    "bank",
    "stores",
    "none"
  )
  levels(dat$housing) <- c("for free", "rent", "own")
  dat$number_credits <- ordered(dat$number_credits)
  levels(dat$number_credits) <- c("1", "2-3", "4-5", ">= 6")
  ## manager/self-empl./highly qualif. employee  was
  ##   management/self-employed/highly qualified employee/officer
  levels(dat$job) <- c(
    "unemployed/unskilled - non-resident",
    "unskilled - resident",
    "skilled employee/official",
    "manager/self-empl./highly qualif. employee"
  )
  levels(dat$people_liable) <- c("3 or more", "0 to 2")
  levels(dat$telephone) <- c("no", "yes (under customer name)")
  levels(dat$foreign_worker) <- c("yes", "no")
  
  ## checks against fahrmeir table
  tabs <- 
    list(status = round(100*prop.table(xtabs(~status+credit_risk, dat),2),2),
         credit_history = round(100*prop.table(xtabs(~credit_history+credit_risk, dat),2),2),
         purpose = round(100*prop.table(xtabs(~purpose+credit_risk, dat),2),2),
         savings = round(100*prop.table(xtabs(~savings+credit_risk, dat),2),2),
         employment_duration = round(100*prop.table(xtabs(~employment_duration+credit_risk, dat),2),2),
         installment_rate = round(100*prop.table(xtabs(~installment_rate+credit_risk, dat),2),2),
         personal_status_sex = round(100*prop.table(xtabs(~personal_status_sex+credit_risk, dat),2),2),
         other_debtors = round(100*prop.table(xtabs(~other_debtors+credit_risk, dat),2),2),
         present_residence = round(100*prop.table(xtabs(~present_residence+credit_risk, dat),2),2),
         property = round(100*prop.table(xtabs(~property+credit_risk, dat),2),2),
         other_installment_plans = round(100*prop.table(xtabs(~other_installment_plans+credit_risk, dat),2),2),
         housing = round(100*prop.table(xtabs(~housing+credit_risk, dat),2),2),
         number_credits = round(100*prop.table(xtabs(~number_credits+credit_risk, dat),2),2),
         job = round(100*prop.table(xtabs(~job+credit_risk, dat),2),2),
         people_liable = round(100*prop.table(xtabs(~people_liable+credit_risk, dat),2),2),
         telephone = round(100*prop.table(xtabs(~telephone+credit_risk, dat),2),2),
         foreign_worker = round(100*prop.table(xtabs(~foreign_worker+credit_risk, dat),2),2))
  
  output$table3<- DT::renderDataTable(DT::datatable({
    tabs$people_liable
  })) 
  
  dat <- select(dat,-c(people_liable,other_installment_plans))
  output$tables<- DT::renderDataTable(DT::datatable({
    dat
  })) 
  
  #generation de l'histogramme des attributs
  output$hist <- renderPlot({
    plot(hist(data[[input$features]]),xlab=paste(input$features), col="cyan",main="Histogram ")
  }) 
  
  #summary
  output$donne <- renderPrint({
    summary(data)
  })
  
  #boite à moustache
  output$dis <- renderPlot({
    boxplot(data[[input$feature]])
  })
  
  #nuage de points
  output$ndp <- renderPlot({
    plot(data[[input$feature1]],dat[[input$fit1]],xlab="Entree 1",ylab="Entree 2")
  })
  
  
  #regle d'association
  
  output$choose_columns <- renderUI({
    checkboxGroupInput("cols", "Choose variables:", 
                       choices  = colnames(data),
                       selected = colnames(data)[1:19])
  })
  
  rules <- reactive({
    data$status=cut(data$status,breaks = 3)
    dataduration=cut(data$duration,breaks = 3)
    data$credit_history=cut(data$credit_history,breaks = 3)
    data$purpose=cut(data$purpose,breaks = 3)
    data$amount=cut(data$amount,breaks = 3)
    data$savings=cut(data$savings,breaks = 3)
    data$employment_duration=cut(data$employment_duration,breaks = 3)
    data$installment_rate=cut(data$installment_rate,breaks = 3)
    data$personal_status_sex=cut(data$personal_status_sex,breaks = 3)
    data$other_debtors=cut(data$other_debtors,breaks = 3)
    data$present_residence=cut(data$present_residence,breaks = 3)
    data$property=cut(data$property,breaks = 3)
    data$age=cut(data$age,breaks = 3)
    data$housing=cut(data$housing,breaks = 3)
    data$number_credits=cut(data$number_credits,breaks = 3)
    data$job=cut(data$job,breaks = 3)
    data$telephone=cut(data$telephone,breaks = 3)
    data$foreign_worker=cut(data$foreign_worker,breaks = 3)
    data$credit_risk=cut(data$credit_risk,breaks = 3)
    tr <- as(data, 'transactions')
    arAll <- apriori(tr, parameter=list(support=input$supp, confidence=input$conf, minlen=input$minL, maxlen=input$maxL))
  }
  )
  
  nR <- reactive({
    nRule <- ifelse(input$samp == 'All Rules', length(rules()), input$nrule)
  })
  output$itemFreqPlot <- renderPlot({
    trans <- as(data, 'transactions')
    itemFrequencyPlot(trans,  cex.names=1)
  }, height=800, width=800)
  
  output$rulesDataTable <- renderDataTable({
    ar <- rules()
    rulesdt <- as(ar,"data.frame")
    rulesdt
  })
  
  output$rulesTable <- renderPrint({
    ar <- rules()
    inspect(sort(ar, by=input$sort))
  })
  output$rulesPertinante <- renderPrint({
    ar<- rules()
    arr<-inspect(head(sort(ar, by='lift'),5))
  })
  
  
  #arbre de decision
  #construction de l'arbre de décision 
  jeu_decision <- dat
  nbre_lignes <- floor((nrow(jeu_decision)*0.7))    
  jeu_decision <- jeu_decision[sample(nrow(jeu_decision)) ,]
  donnee_apprentissage <- jeu_decision[1:nbre_lignes , ]
  donnee_test <- jeu_decision[(nbre_lignes+1):nrow(jeu_decision) , ] 
  arbre <- rpart(credit_risk ~. , data = donnee_apprentissage)
  output$decision <- renderPlot({
    rpart.plot(arbre)
  })
  
  
 #validation du modèle
  prediction <- predict(arbre , donnee_test[,-21] , type='class')
  data.frame(donnee_test$credit_risk ,prediction)
  mc  <- table(donnee_test$credit_risk ,prediction )
  mce <- CrossTable(donnee_test$credit_risk , prediction)
  output$confusion1 <- renderPrint({
    mce$t
  })
  #taux de réussite 
  somme<- ((mc[1,1] + mc[2,2])/sum(mc))*100
  output$taux_reussite <-renderText({
    somme
  })
  
  #precision avec l'arbre de décision
  output$precision1 <- renderText({
    mc[1,1]/(mc[1,1]+mc[2,1])
  })
  output$precision1_1 <- renderText({
    (mc[1,1]/(mc[1,1]+mc[2,1]))*100
  })
  output$precision2 <- renderText({
    mc[2,2]/(mc[2,2]+mc[1,2])
  })
  output$precision2_2 <- renderText({
    (mc[2,2]/(mc[2,2]+mc[1,2]))*100
  })
  #rappel avec l'arbre de decision
  output$rappel1 <- renderText({
    (mc[1,1]/(mc[1,1]+mc[1,2]))*100
  })
  output$rappel2 <- renderText({
    (mc[2,2]/(mc[2,2]+mc[2,1]))*100
  })
  
  router$server(input, output, session)
}