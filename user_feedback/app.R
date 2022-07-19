library(shiny)
library(shinyFeedback)
ui <- fluidPage(
  shinyFeedback::useShinyFeedback(),
  textInput("dataset", "Dataset Name"),
  tableOutput("data")
)

server <- function(input, output, session) {
  data <- reactive({
    req(input$dataset)
    
    exists <- exists(input$dataset, "package:datasets")
    shinyFeedback::feedbackDanger("dataset", !exists, "Unknown Dataset")
    req(exists, cancelOutput = TRUE)
    
    get(input$dataset, "package:datasets")
  })
  
  output$data <- renderTable({
    head(data())
  })
}

shinyApp(ui = ui, server = server)