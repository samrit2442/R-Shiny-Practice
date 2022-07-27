library(shiny)

ui <- fluidPage(
  actionButton("goodnight", "Good Night")
)

server <- function(input, output, session) {
  observeEvent(input$goodnight, {
    showNotification("So long")
    Sys.sleep(1)
    showNotification("Farewell", type = "message")
    Sys.sleep(1)
    showNotification("Shubho Ratri", type = "warning")
    Sys.sleep(1)
    showNotification("Abar asibo phire", type = "error")
  })
}

shinyApp(ui = ui, server = server)
