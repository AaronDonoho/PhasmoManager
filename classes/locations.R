Location = R6Class(
  "Location",
  public = list(
    name = NULL,
    subLocations = list(),
    lightsOn = F,
    
    initialize = function(name, lightsOn = F) {
      self$name = name
      self$lightsOn = lightsOn
    },
    
    findFright = function() {
      fright = 0;
      if (!self$lightsOn) {
        fright = fright + 0.25
      }
      return(fright)
    }
    
  )
)

Cabin = R6Class(
  "Cabin",
  inherit = Location,
  public = list(
    initialize = function(name) {
      super$initialize(name)
    }
  )
)

locations = list(
  "Cabin" = "Cabin"
)

randomLocation = function() {
  Cabin$new("Ulnawood Cabin")
}


