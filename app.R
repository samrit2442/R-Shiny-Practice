library(shiny)

sales <- readr::read_csv("https://raw.githubusercontent.com/hadley/mastering-shiny/master/sales-dashboard/sales_data_sample.csv", na = " ")
sales <- sales[c(
  "TERRITORY", "ORDERDATE", "ORDERNUMBER", "PRODUCTCODE",
  "QUANTITYORDERED", "PRICEEACH"
)]

unique(sales$TERRITORY)

ui <- fluidPage(
  selectInput("territory", "territory", choices = unique(sales$TERRITORY)),
  tableOutput("selected")
)

server <- function(input, output, session) {
  selected <- reactive({
    if(input$territory == "NA") {
      subset(sales, is.na(TERRITORY))
    } else {
      subset(sales, TERRITORY == input$territory)
    }
  })
  output$selected <- renderTable(head(selected(), 10))
}

# Run the application
shinyApp(ui = ui, server = server)

# sales[sales$TERRITORY == "EMEA", ]
# head(sales$TERRITORY == "EMEA", 25)














