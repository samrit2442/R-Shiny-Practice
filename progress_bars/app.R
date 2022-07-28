library(shiny)

ui <- fluidPage(
  numericInput("steps", "How many steps?", 10),
  actionButton("go", "Go"),
  textOutput("result")
)

server <- function(input, output, session) {
  data <- eventReactive(input$go, {
    withProgress(message = "Computing random number", {
      for (i in seq_len(input$steps)) {
        Sys.sleep(0.5)
        incProgress(1 / input$steps)
      }
      runif(1)
    })
  })
  
  output$result <- renderText(round(data(), 2))
}
shinyApp(ui = ui, server = server)