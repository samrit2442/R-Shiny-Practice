library(shiny)
library(cicerone)

guide <- Cicerone$
  new(mathjax = TRUE)$ # enable MathJax
  step(
    el = "text_inputId",
    title = helpText('Dynamic output 1:  $$\\alpha^2$$'),
    description = "This is where you enter the text you want to print."
  )$
  step(
    "submit_inputId",
    helpText('The busy Cauchy distribution
               $$\\frac{1}{\\pi\\gamma\\,\\left[1 +
               \\left(\\frac{x-x_0}{\\gamma}\\right)^2\\right]}\\!$$'),
    helpText('You do not see me initially: $$e^{i \\pi} + 1 = 0$$')
  )

ui <- fluidPage(
  withMathJax(), # include MathJax
  use_cicerone(), 
  textInput("text_inputId", "Enter some text"),
  actionButton("submit_inputId", "Submit text"),
  verbatimTextOutput("print")
)

server <- function(input, output){
  
  guide$init()$start()
  
  txt <- eventReactive(input$submit_inputId, {
    input$text_inputId
  })
  
  output$print <- renderPrint(txt())
}

shinyApp(ui, server)