#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param path
#' @return
#' @author njtierney
#' @export
read_air <- function(path) {
  read_csv(path) |>
    drop_na() |>
    clean_names()
}
