#' @title Plot of Benthic PCoA Analysis
#' @description This function plots the PCoA run previously, adding elements that visualize factors habitat coordinates and species.
#' @param benthic.species.scores A data frame of species scores
#' @param benthic.site.scores A data frame of site scores
#' @param benthic.hulls A data frame containing convex hull coordinates
#' @return A ggplot object
#' @export
benthic_plot <- function(benthic.species.scores,
    benthic.site.scores,
    benthic.hulls) {
  ggplot2::ggplot() +
    # plot species loadings as vectors
    ggplot2::geom_segment(data = benthic.species.scores,
                 ggplot2::aes(x = 0, y = 0, xend = Dim1, yend = Dim2),
                 arrow = grid::arrow(length = grid::unit(0.2, "cm")),
                 color = "grey10",
                 linewidth = 0.4) +

    # plot ellipses
    ggplot2::stat_ellipse(data = benthic.site.scores,
                 ggplot2::aes(Dim1, Dim2, color = Habitat), type = "norm",
                 linetype = 2) +

    # plot convex hulls
    ggplot2::geom_polygon(data = benthic.hulls,
                 ggplot2::aes(Dim1, Dim2, fill = Habitat, group = Habitat),
                 alpha = 0.6, color = "grey23",
                 linewidth = 0.1) +

    # plot habitat coordinates
    ggplot2::geom_point(data = benthic.site.scores,
               ggplot2::aes(Dim1, Dim2, fill = Habitat, shape = Habitat),
               size = 3, alpha=0.9) +

    # add species labels
    ggrepel::geom_text_repel(
      data = benthic.species.scores,
      ggplot2::aes(Dim1, Dim2, label = species),
      fontface = "bold") +
    # aesthetics
    ggplot2::theme(
      axis.text = ggplot2::element_text(color = "black", size = 12),
      text = ggplot2::element_text(color = "black", size = 6)) +
    ggplot2::scale_color_manual(values = c("#FB9A29", "#CC6677", "#9970AB")) +
    ggplot2::scale_fill_manual(values = c("#FB9A29", "#CC6677", "#9970AB")) +
    ggplot2::scale_shape_manual(values = c(21, 22, 23)) +
    ggplot2::labs(x = "Dimension 1", y = "Dimension 2") +
    ggplot2::theme_classic()
}
