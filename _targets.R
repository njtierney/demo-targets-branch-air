# packages to load for project
source("packages.R")

# source everything in R/ directory
tar_source("R")

## tar_assign() is used so you can specify your targets with `<-` and
# tar_target()/tar_file()/etc.
# We use `{` to mean "we can write multiple lines of R code
tar_assign({
  # tar_file is used for file paths. This means that "may_path" will be watched
  # and if the data changes in that location, it will make the target out of
  # date, making the other ones need to run
  may_path <- "data-raw/monthly/air-quality-1973-05.csv" |> tar_file()

  # Read the data in using read_air(), which is in R/
  # We use tar_target() to mark this as a target
  air_may <- read_air(may_path) |> tar_target()

  model_formula <- "ozone ~ temp" |> tar_target()

  air_fit <- fit_ozone(
    data = air_may,
    formula = model_formula
  ) |>
    tar_target()

  # tidy - coefficients in a table
  air_coefs <- tidy_model(air_fit, model_formula) |> tar_target()

  # glance - one line table summary, of model fit
  air_glance <- glance_model(air_fit, model_formula) |> tar_target()

  # augment - adds the residuals and predicted values to thedata
  air_augmented <- augment_model(air_fit, model_formula) |> tar_target()

  # Use tar_quarto to ensure you render a quarto document
  # Look inside docs/eda.qmd to see how to load targets inside a file/document
  report <- tar_quarto("docs/eda.qmd")
})
