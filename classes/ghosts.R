Ghost = R6Class(
  "Ghost",
  public = list(
    type = NULL,
    fright = NULL,
    
    initialize = function(type, fright = 1) {
      self$type = type
      self$fright = fright
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



