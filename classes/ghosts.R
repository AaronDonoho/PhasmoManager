Ghost = R6Class(
  "Ghost",
  public = list(
    type = NULL,
    
    initialize = function(type) {
      self$type = type
    }
  )
)

Wraith = R6Class(
  "Wraith",
  inherit = Ghost,
  public = list(
    
    initialize = function(type) {
      super$initialize("Wraith")
    }
  )
)

Demon = R6Class(
  "Demon",
  inherit = Ghost,
  public = list(
    
    initialize = function() {
      super$initialize("Demon")
    }
  )
)

ghosts = list(
  "Demon" = "Demon",
  "Wraith" = "Wraith"
)

randomGhost = function() {
  sample(ghosts, 1)
}



