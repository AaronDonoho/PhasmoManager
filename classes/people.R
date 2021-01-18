Hunter = R6Class(
  "Hunter",
  public = list(
    name = NULL,
    sanity = NULL,
    
    initialize = function(name, sanity = 100) {
      self$name = name
      self$sanity = sanity
    },
    
    sanityDrain = function(fright) {
      self$sanity = max(0, self$sanity - fright)
    }
  )
)

firstNames = c("Rob", "Randy", "Devin", "Chip", "Mike", "Amy", "Melanie", "Benjamin", "Kevin", "Kyle", "Jessica", "Kelsey")
lastNames = c("Smith", "White", "Black", "Janson", "Brown", "Harris", "Peterson", "Chambers")

randomName = function() {
  paste(sample(firstNames, 1), sample(lastNames, 1))
}