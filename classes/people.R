Hunter = R6Class(
  "Hunter",
  public = list(
    name = NULL,
    maxSanity = NULL,
    sanity = NULL,
    location = NA,
    locationName = NA,
    
    initialize = function(name, maxSanity = 100) {
      self$name = name
      self$maxSanity = maxSanity
      self$sanity = maxSanity
    },
    
    sanityDrain = function() {
      if (!is.R6(self$location)) {
        return()
      }
      fright = self$location$findFright()
      self$sanity = max(0, self$sanity - fright)
    },
    
    enterLocation = function(location) {
      self$location = location
      self$locationName = location$name
    },
    
    huntCleanup = function() {
      self$sanity = self$maxSanity
      self$location = NA
      self$locationName = NA
    }
  ),
  active = list(
    fuzzySanity = function() {
      max(0, min(self$maxSanity, round(self$sanity + runif(1) * 5 - 2.5)))
    }
    
    
  )
)

firstNames = c("Rob", "Randy", "Devin", "Chip", "Mike", "Amy", "Melanie", "Benjamin", "Kevin", "Kyle", "Jessica", "Kelsey")
lastNames = c("Smith", "White", "Black", "Janson", "Brown", "Harris", "Peterson", "Chambers")

randomName = function() {
  paste(sample(firstNames, 1), sample(lastNames, 1))
}