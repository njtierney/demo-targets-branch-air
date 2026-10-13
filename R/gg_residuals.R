gg_residuals <- function(augmented_data) {
  ggplot(
    augmented_data,
    aes(
      x = .fitted,
      y = .resid
    )
  ) +
    geom_hline(
      yintercept = 0,
      linewidth = 1,
      linetype = 3
    ) +
    geom_point()
}
