# epoxy ----

library(epoxy)

# Extra-strength `glue` for scripts, reports, and aps

## expoxy is super glue ----

### In R Markdown and Quarto reports ----

# Use epoxy chunks for extra-strength inline syntax.
# Just `library(epoxy` in your R Markdown or Quarto document to get started.

# All epoxy chunks make it easy to transform values in place with a 
# `cli` inspired inline syntax described in
?epoxy_transform_inline


## In R scripts ----

# The same functions that power epoxy chunks are available in three flavors:

# - `epoxy()` for markdown and general purpose outputs

# - `epoxy_html()` for HTML outpouts, with added support for HTMl templating
?epoxy_transform_html


# - `epoxy_latex()` for LaTeX reports

# These functions are accompanied by a robust system for chained glue-transformers
# powered by `epoxy_transform()`.


## In Shiny apps ----

# `us_epoxy_html()` makes it easy to update text or HTML dynamically,
# anywhere in your Shiny app's UI:

# For more complicated situations, `ui_epoxy_mustache()` lets you turn
# any Shiny UI into a template that leverages the Mustache templating language.

# END