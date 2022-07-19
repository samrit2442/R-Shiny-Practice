library(shiny)

ui <- fluidPage(
  selectInput("language", "Language", choices = c("", "English", "Bengali")),
  textInput("name", "Name"),
  textOutput("greeting")
)

server <- function(input, output, session) {
  greetings <- c(English = "Hello",
                 Bengali = "Namaskar")
  
  output$greeting <- renderText({
    req(input$language, input$name)
    paste0(greetings[[input$language]], " ", input$name, "!")
  })
}
shinyApp(ui = ui, server = server)