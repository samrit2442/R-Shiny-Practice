library(shiny)

ui <- fluidPage(
  fileInput("upload", "Upload a file", accept = c(".csv, .xlsx, .txt"),
            placeholder = "Nibiru has not uploaded a file yet", width = "400px"),
  tableOutput("files")
)

server <- function(input, output, session) {
  output$files <- renderTable(input$upload)
}

shinyApp(ui = ui, server = server)

