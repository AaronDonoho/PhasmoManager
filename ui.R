library(shinythemes)

ui <- fluidPage(
  theme = shinythemes::shinytheme('flatly'),
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
    tags$meta(name = "viewport", content = "width=device-width, initial-scale=1.0")
  ),
  router$ui,
  useShinyjs()
)
