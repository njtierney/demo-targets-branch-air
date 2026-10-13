fit_ozone <- function(data, formula) {
  lm(as.formula(formula), data = data)
}
