glance_model <- function(model, formula) {
  glance(model) |>
    mutate(
      formula = formula,
      .before = everything()
    )
}
