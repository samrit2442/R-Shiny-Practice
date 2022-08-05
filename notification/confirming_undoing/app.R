library(shiny)

ui <- fluidPage(
  actionButton("delete", "Delete All files?"),
  
  modal_confirm <- modalDialog(
    "Are you sure you want to continue?",
    title = "Deleting files",
    footer = tagList(
      actionButton("cancel", "Cancel"),
      actionButton("ok", "Delete", class = "btn btn-danger")
    )
  )
)

server <- function(input, output, session) {
  observeEvent(input$delete, {
    showModal(modal_confirm)
  })
  
  observeEvent(input$ok, {
    showNotification("Files deleted")
    removeModal()
  })
  
  observeEvent(input$cancel, {
    removeModal()
  })
}

shinyApp(ui = ui, server = server)
