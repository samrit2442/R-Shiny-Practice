library(shiny)
library(shinycssloaders)

ui <- fluidPage(
  actionButton("go", "Go"),
  withSpinner(plotOutput("plot")),
)
server <- function(input, output, session) {
  data <- eventReactive(input$go, {
    Sys.sleep(3)
    data.frame(x = rnorm(50), y = runif(50))
  })
  
  output$plot <- renderPlot(plot(data(), type = "b"), res = 96)
}

shinyApp(ui = ui, server = server)