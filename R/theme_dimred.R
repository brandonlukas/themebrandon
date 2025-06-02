#' Brandon's Theme for Dimensionality Reduction Plots
#'
#' A minimalist theme optimized for UMAP, PCA, t-SNE, and similar plots,
#' with optional axis labeling.
#'
#' @param label Logical. If TRUE (default), show axis labels and lines; otherwise, hide them.
#' @param square Logical. If TRUE (default), sets aspect ratio to 1 (square plot); if FALSE, does not set aspect ratio.
#'
#' @return A ggplot2 theme or list of theme + guides.
#' @export
#'
#' @examples
#' library(ggplot2)
#' df <- data.frame(UMAP1 = rnorm(100), UMAP2 = rnorm(100))
#' ggplot(df, aes(UMAP1, UMAP2)) +
#'   geom_point() +
#'   theme_dimred()
theme_dimred <- function(label = TRUE, square = TRUE) {
  theme_args <- list(
    axis.ticks = ggplot2::element_blank(),
    axis.text = ggplot2::element_blank(),
    axis.title = if (label) {
      ggplot2::element_text()
    } else {
      ggplot2::element_blank()
    },
    axis.line = if (label) {
      ggplot2::element_line()
    } else {
      ggplot2::element_blank()
    }
  )
  if (square) {
    theme_args$aspect.ratio <- 1
  }

  dimred_theme <- do.call(ggplot2::theme, theme_args)

  dimred_theme
}
