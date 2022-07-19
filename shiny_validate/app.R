library(shiny)

ui <- fluidPage(
  numericInput("x", "X", value = 0),
  selectInput("trans", "Transformation", choices = c("square", "log", "square-root")),
  textOutput("out")
)

server <- function(input, output, session){
  output$out <- renderText({
    if (input$x < 0 && input$trans %in% c("log", "square-root")) {
      validate("x cannot be negative for this transformation")
    }
    
    switch(input$trans,
           square = input$x ^ 2,
           "square-root" = sqrt(input$x),
           log = log(input$x))
  })
}

shinyApp(ui = ui, server = server)
