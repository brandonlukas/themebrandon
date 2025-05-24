#' Brandon's Theme for Dimensionality Reduction Plots
#'
#' A minimalist theme optimized for UMAP, PCA, t-SNE, and similar plots,
#' with optional axis labeling. Uses `ggh4x::guide_axis_truncated()` for visual clarity.
#'
#' @param label Logical. If TRUE (default), show axis labels and lines; otherwise, hide them.
#' @param base_size Numeric. Used to determine axis line thickness if `label = TRUE`.
#' @param text_size Numeric. Font size for axis titles if `label = TRUE`.
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
theme_dimred <- function(label = TRUE, base_size = 8, text_size = 7, square = TRUE) {
  axis_guide <- ggh4x::guide_axis_truncated(
    trunc_lower = grid::unit(0, "npc"),
    trunc_upper = grid::unit(0.2, "npc")
  )

  theme_args <- list(
    axis.ticks = ggplot2::element_blank(),
    axis.text = ggplot2::element_blank(),
    axis.title = if (label) {
      ggplot2::element_text(hjust = 0, size = text_size)
    } else {
      ggplot2::element_blank()
    },
    axis.line = if (label) {
      ggplot2::element_line(linewidth = base_size / 22)
    } else {
      ggplot2::element_blank()
    }
  )
  if (square) {
    theme_args$aspect.ratio <- 1
  }

  dimred_theme <- do.call(ggplot2::theme, theme_args)

  if (label) {
    list(dimred_theme, ggplot2::guides(x = axis_guide, y = axis_guide))
  } else {
    dimred_theme
  }
}
