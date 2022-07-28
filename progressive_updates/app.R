library(shiny)

ui <- fluidPage(
  tableOutput("data")
)

server <- function(input, output, session) {
  notify <- function(msg, id = NULL) {
    showNotification(msg, id = id, duration = NULL, closeButton = FALSE)
  }
  
  data <- reactive({
    id <- notify("Reading data...")
    on.exit(removeNotification(id), add = TRUE)
    Sys.sleep(1)
    
    notify("Reticulating splines...", id = id)
    Sys.sleep(1)
    
    notify("Herding llamas...", id = id)
    Sys.sleep(1)
    
    notify("Orthogonalizing matrices...", id = id)
    Sys.sleep(1)
    
    mtcars
  })
  
  output$data <- renderTable(head(data()))
}

shinyApp(ui = ui, server = server)
