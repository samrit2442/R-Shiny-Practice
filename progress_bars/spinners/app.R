library(shiny)
library(waiter)

ui <- fluidPage(
  waiter::use_waiter(),
  actionButton("go", "Go"),
  textOutput("result"),
  # selectInput("id","Select from the List", choices = c("ব্রহ্মাণ্ড", "ছায়াপথ", "নক্ষত্র্র"))
)

server <- function(input, output, session) {
  data <- eventReactive(input$go, {
    waiter <- waiter::Waiter$new(html = spin_orbit()) ## Create a new Progress Bar
    waiter$show()
    on.exit(waiter$hide())  ## Automatically close it done
    
    Sys.sleep(2)
    runif(1)
  })
  
  output$result <- renderText(round(data(), 2))
}

shinyApp(ui = ui, server = server)
