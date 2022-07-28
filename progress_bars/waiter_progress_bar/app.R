library(shiny)
library(waiter)

ui <- fluidPage(
  waiter::use_waitress(),
  numericInput("steps", "How many steps?", 10),
  actionButton("go", "Go"),
  textOutput("result")
)

server <- function(input, output, session) {
  data <- eventReactive(input$go, {
    waitress <- waiter::Waitress$new(max = input$steps) ## Create a new Progress Bar
    on.exit(waitress$close())  ## Automatically close it done
    
    for (i in seq_len(input$steps)) {
      Sys.sleep(0.5)
      waitress$inc(1)  ## Increment one step
    }
    
    runif(2)
  })
  
  output$result <- renderText(round(data(), 2))
}

shinyApp(ui = ui, server = server)