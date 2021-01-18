library(R6)
library(shiny.router)
library(shiny)
library(shinyjs)

source("./classes/ghosts.R")
source("./classes/people.R")

landing_page = div(
    div(
        class = "big-container",
        actionButton("beginHunt", "Begin Hunt")
    )
)

hunt_page = div(
    tableOutput("hunterTable"),
    selectInput("ghostSelect", "Ghost Selection", ghosts),
    actionButton("leaveHuntButton", "Leave Hunt")
)

hunt_results_page = div(
    uiOutput("huntResults"),
    actionButton("acceptResultsButton", "Accept")
)

router = make_router(
    route("/", landing_page),
    route("hunt", hunt_page),
    route("huntResults", hunt_results_page)
)




