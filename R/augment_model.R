augment_model <- function(model, formula) {
  augment(model) |>
    mutate(
      formula = formula,
      .before = everything()
    )
}
