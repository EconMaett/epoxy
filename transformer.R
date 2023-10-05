# Epoxy Inline Transformer ----
library(epoxy)
# This epoxy transformer is inspired by the `cli` package.

# To transform a template expression inline, include a keyword, prefixed with
# a dot (`.`) that is used to format the value of the template expression in place.
epoxy("It cost {.dollar 123456}", .transformer = "inline")
# It cost $123,456

# The formatters, e.g. `.dollar` in the example above, can be customized using the
# arguments of `epoxy_transform_inline()`.

# Pass a customized `scales::label_dollar()` to `.dollar` to achieve
# a different transformation.

dollars_nzd <- scales::label_dollar(suffix = " NZD")

epoxy(
  "It cost {.dollar 123456}.",
  .transformer = epoxy_transform_inline(.dollar = dollars_nzd)
)
# It cost $123,456 NZD.


# Note that, unlike inline markup with cli, the text within the template expression,
# other than the keyword, is treated as an R expression.
money <- 123456
epoxy("It cost {.dollar money}.", .transformer = "inline")
# It cost $123,456.

# You can also nest inline markup expressions
money <- c(123.456, 234.567)
epoxy("It will cost either {.or {.dollar money}}.", .transformer = "inline")
# It will cost either $123.456 or $234.567.


# Finally, you can provide your own functions that are applied to the evaluated expression.
# In this example, I add a `.runif` inline formatter that generates `n` random numbers
# (taken from the template expression) and sorts them.
set.seed(4242)

epoxy(
  "Here are three random percentages: {.and {.pct {.runif 3}}}.",
  .transformer = epoxy_transform_inline(
    .runif = function(n) sort(runif(n))
  )
)
# Here are three random percentages: 23%, 35% und 99%.


## Examples ----
revenue <- 0.2123
sales <- 42000.134

# --- Basic Example with Inline Formatting ----
epoxy(
  "{.pct revenue} of revenue generates {.dollar sales} in profits."
)
# 21% of revenue generates $42,000.13 in profits.

# With standard {glue} (`epoxy_transform_inline()` is a glue transformer)
glue::glue(
  "{.pct revenue} of revenue generates {.dollar sales} in profits.",
  .transformer = epoxy_transform_inline()
)
# 21% of revenue generates $42,000.13 in profits.


# --- Setting Inline Formatting Options ----
# To set inline format options, provide `scales::label_*()` to the supporting
# epoxy_transform_inline arguments.
epoxy(
  "{.pct revenue} of revenue generates {.dollar sales} in profits.",
  .transformer = epoxy_transform_inline(
    .percent = scales::label_percent(accuracy = 0.1),
    .dollar = scales::label_dollar(accuracy = 10)
  )
)
# 21.2% of revenue generates $42,000 in profits.

glue::glue(
  "{.pct revenue} of revenue generates {.dollar sales} in profits.",
  .transformer = epoxy_transform_inline(
    .percent = scales::label_percent(accuracy = 0.1),
    .dollar = scales::label_dollar(accuracy = 10)
  )
)
# 21.2% of revenue generates $42,000 in profits.


# ---- Custom Inline Formatting ----
# Add your own formatting functions
search <- "why are cats scared of cucumbers"

epoxy_html(
  "https://example.com?q={{ .url_encode search }}>",
  .transformer = epoxy_transform_inline(
    .url_encode = utils::URLencode
  )
)
# https://example.com?q=why%20are%20cats%20scared%20of%20cucumbers>