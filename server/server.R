server <- function(input , output, session) {
  output$bank1 <- renderImage({
    list(src = "image/money.png",
         width = "100%",
         height = 500)
  }, deleteFile = F)
    router$server(input, output, session)
}