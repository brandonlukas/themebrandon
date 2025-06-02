# themebrandon

Custom ggplot2 themes for R, designed for clarity, minimalism, and ease of use in both presentations and dimensionality reduction plots.

## Overview

This repository provides two primary ggplot2 themes:

- **`theme_brandon`**:  
  A minimalist theme with balanced text and line size, supporting both light/dark modes and transparent backgrounds. Ideal for embedding plots in PowerPoint or other presentations.

- **`theme_dimred`**:  
  A theme optimized for dimensionality reduction plots (e.g., UMAP, PCA, t-SNE) with options for axis labeling and improved visual clarity via truncated axis guides.

## Installation

To use these themes, install directly from GitHub using `devtools`:

```r
# install.packages("devtools")
devtools::install_github("brandonlukas/themebrandon")
```

## Usage

### theme_brandon

A flexible, minimalist theme for general ggplot2 plots.

```r
library(ggplot2)
library(themebrandon)

# Light mode, transparent background (default)
ggplot(mtcars, aes(mpg, wt)) +
  geom_point() +
  theme_brandon()

# Dark mode
ggplot(mtcars, aes(mpg, wt)) +
  geom_point(color = "gold") +
  theme_brandon(dark = TRUE)

# Opaque background
ggplot(mtcars, aes(mpg, wt)) +
  geom_point() +
  theme_brandon(transparent = FALSE)
```

**Parameters:**
- `base_size`: Base font size (default: 8)
- `text_size`: Font size for most text elements (default: 7)
- `dark`: Logical, use dark mode? (default: FALSE)
- `transparent`: Logical, use transparent background? (default: TRUE)

---

### theme_dimred

A minimalist theme optimized for dimensionality reduction plots, with optional axis labeling and an option to enforce a square aspect ratio.

```r
library(ggplot2)
library(themebrandon)

df <- data.frame(UMAP1 = rnorm(100), UMAP2 = rnorm(100))
ggplot(df, aes(UMAP1, UMAP2)) +
  geom_point() +
  theme_dimred()
```

**Parameters:**
- `label`: Logical. Show axis labels and lines? (default: TRUE)
- `square`: Logical. If TRUE (default), sets aspect ratio to 1 (square plot); if FALSE, does not set aspect ratio.

## Features

- Minimalist, presentation-friendly visual design
- Support for light/dark modes and transparency
- Special optimizations for scatter plots and dimensionality reduction visualizations

## License

MIT License

---

**Author:** [brandonlukas](https://github.com/brandonlukas)