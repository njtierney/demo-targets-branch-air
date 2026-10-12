source("packages.R")

tar_source("R")

tar_assign({
  may_path <- "data-raw/monthly/air-quality-1973-05.csv" |> tar_file()

  air_may <- read_air(may_path) |> tar_target()

  air_fit <- lm(ozone ~ temp, data = air_may) |> tar_target()

  # tidy - coefficients in a table
  air_coefs <- tidy(air_fit) |> tar_target()

  # glance - one line table summary, of model fit
  air_glance <- glance(air_fit) |> tar_target()

  # augment - adds the residuals and predicted values to thedata
  air_augmented <- augment(air_fit) |> tar_target()

  report <- tar_quarto("docs/eda.qmd")
})
