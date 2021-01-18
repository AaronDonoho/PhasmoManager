library(purrr)

server <- function(input, output, session) {
  
  router$server(input, output, session)
  
  team = reactiveVal(c(Hunter$new(randomName())))
  teamDf = reactiveVal(data.frame())
  ghostSelection = reactiveVal()
  ghost = reactiveVal()
  slow_tick = reactiveTimer(2000, session)
  
  observe({
    slow_tick()
    isolate({
      teamDf(
        data.frame(
          "Hunters" = team() %>% map("name") %>% unlist()
        ))
    })
  })
  
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
  
  output$hunterTable = renderTable({
    teamDf()
  })
  
}
