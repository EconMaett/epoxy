# epoxy in R scripts ----

# You can use the `epoxy()` function just like an `epoxy` knitr chunk.

# This allows you to use epoxy in your R scripts, anyhwere you have
# previously used glue.

library(epoxy)

movie <- list(
  year = 1989,
  title = "Back to the Future Part II",
  budget = 4e+07
)

epoxy(
  "The movie {.titlecase movie$title}",
  "was released in {movie$year}",
  "and was filmed iwth a budget of",
  "{.dollar movie$budget}.",
  .sep = "\n"
)
# The movie Back to the Future Part II
# was released in 1989
# and was filmed iwth a budget of
# $40,000,000.


# END