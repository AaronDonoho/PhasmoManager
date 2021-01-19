library(purrr)

server <- function(input, output, session) {
  
  router$server(input, output, session)
  
  huntActive = reactiveVal(F)
  team = reactiveVal(c(Hunter$new(randomName())))
  teamDf = reactiveVal(data.frame())
  ghostSelection = reactiveVal()
  ghost = reactiveVal()
  huntLocation = reactiveVal()
  slow_tick = reactiveTimer(2000, session)
  fast_tick = reactiveTimer(500, session)
  
  observe({
    slow_tick()
    isolate({
      teamDf(
        data.frame(
          "Hunters" = team() %>% map("name") %>% unlist(),
          "Sanity" = team() %>% map("fuzzySanity") %>% unlist(),
          "Location" = team() %>% map("locationName") %>% unlist() 
      ))
    })
  })
  
  observe({
    fast_tick()
    isolate({
      if (huntActive()) {
        for (hunter in team()) {
          hunter$sanityDrain()
        }
      }
    })
  })
  
  observeEvent(input$ghostSelect, {
    ghostSelection(input$ghostSelect)
  })
  
  observeEvent(input$beginHunt, {
    change_page("hunt")
    ghost(randomGhost())
    huntLocation(randomLocation())
    huntActive(T)
    
    for (hunter in team()) {
      hunter$enterLocation(huntLocation())
    }
  })
  
  observeEvent(input$leaveHuntButton, {
    huntActive(F)
    huntLocation(NA)
    for (hunter in team()) {
      hunter$huntCleanup()
    }
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
  }, digits = 0)
  
}
