#' Brandon's Favorite ggplot2 Theme (Light/Dark, Transparent Option)
#'
#' A minimalist theme with balanced text and line size, supporting light/dark modes
#' and transparent backgrounds for easy PowerPoint embedding.
#'
#' @param base_size Base font size (default: 8).
#' @param text_size Font size for most plot text elements (default: 7).
#' @param dark Logical, use dark mode? Default is FALSE.
#' @param transparent Logical, use transparent backgrounds? Default is TRUE.
#'
#' @return A ggplot2 theme object.
#' @export
#'
#' @examples
#' ggplot(mtcars, aes(mpg, wt)) + geom_point() + theme_brandon()
#' ggplot(mtcars, aes(mpg, wt)) + geom_point(color = "gold") + theme_brandon(dark = TRUE)
#' ggplot(mtcars, aes(mpg, wt)) + geom_point() + theme_brandon(transparent = FALSE)
theme_brandon <- function(base_size = 8, text_size = 7, dark = FALSE, transparent = TRUE) {
  bg_color <- if (transparent) "transparent" else if (dark) "#000000" else "#FFFFFF"
  fg_color <- if (dark) "#FFFFFF" else "#000000"

  ggplot2::theme_linedraw(base_size = base_size) +
    ggplot2::theme(
      # Backgrounds
      panel.background = ggplot2::element_rect(fill = bg_color, color = NA),
      plot.background = ggplot2::element_rect(fill = bg_color, color = NA),
      legend.background = ggplot2::element_rect(fill = bg_color, color = NA),
      legend.box.background = ggplot2::element_rect(fill = bg_color, color = NA),
      strip.background = ggplot2::element_rect(fill = bg_color, color = NA),

      # No borders or grid
      panel.border = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),

      # Axis styling
      axis.line = ggplot2::element_line(linewidth = base_size / 22, color = fg_color),
      axis.ticks = ggplot2::element_line(linewidth = base_size / 22, color = fg_color),

      # Text
      axis.title = ggplot2::element_text(size = text_size, color = fg_color),
      axis.text = ggplot2::element_text(size = text_size, color = fg_color),
      plot.title = ggplot2::element_text(size = text_size, hjust = 0, color = fg_color),
      legend.title = ggplot2::element_text(size = text_size, color = fg_color),
      legend.text = ggplot2::element_text(size = text_size, color = fg_color),
      strip.text = ggplot2::element_text(size = text_size, color = fg_color),

      # Facet strips
      strip.clip = "off"
    )
}
