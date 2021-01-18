
server <- function(input, output, session) {
  
  router$server(input, output, session)
  
  team = reactiveVal(c())
  ghostSelection = reactiveVal()
  ghost = reactiveVal()
  
  observeEvent(input$ghostSelect, {
    ghostSelection(input$ghostSelect)
  })
  
  observeEvent(input$beginHunt, {
    change_page("hunt")
    ghost(randomGhost())
  })
  
  observeEvent(input$leaveHuntButton, {
    change_page("huntResults")
  })
  
  observeEvent(input$acceptResultsButton, {
    change_page("/")
  })
  
  output$huntResults = renderUI({
    div(
      p(paste("You report claims the ghost was a", ghostSelection())),
      p(paste("The ghost was a", ghost()))
    )
  })
  
}
