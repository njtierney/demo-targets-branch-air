#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param air_fit
#' @param model_formula
#' @return
#' @author njtierney
#' @export
tidy_model <- function(air_fit, model_formula) {
  tidy(air_fit) |>
    mutate(
      model = model_formula,
      .before = everything()
    )
}
