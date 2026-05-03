#' @title Habitat Effect on Coral Cover
#' @description This function determines the interaction between coral cover and habitat of our Bayesian GLM
#' @param data data object being used
#' @param model fitted Bayesian model object being used
#' @return A ggplot object
#' @export
habitat_effect <- function(data, model) {
    if (missing(data) || missing(model)) {
      stop("Both `data` and `model` must be provided.", call. = FALSE)
    }
    stopifnot(is.data.frame(data))
  # create a data grid that holds macroalgae fixed at its mean
  # this allows us to isolate the effects of solely habitat on coral cover
  data |>
    modelr::data_grid(Habitat = unique(data$Habitat),  # use all unique levels of 'Habitat'
            Macroalgae = mean(data$Macroalgae, na.rm = TRUE)) |>

    # add predicted coral cover values from the model
    tidybayes::add_epred_draws(model,
                    regex = TRUE,
                    ndraws = 200, # takes 200 posterior draws of coral cover
                    seed = 690) |>

    # plot the predicted coral values by each habitat
    ggplot2::ggplot(
      ggplot2::aes(x = Habitat, y = .epred, color = Habitat, fill = Habitat)
    ) +
    ggdist::stat_histinterval(alpha = 0.8, justification = -0.2) + # plots distribution of predicted values
    ggplot2::theme_bw() + # aesthetics
    ggplot2::coord_cartesian(ylim = c(0, 0.3)) +
    ggplot2::xlab("Habitat") +
    ggplot2::ylab("Predicted coral cover (%)") +
    ggplot2::scale_color_manual(values = c("#FB9A29", "#CC6677", "#9970AB"))+
    ggplot2::scale_fill_manual(values = c("#FB9A29", "#CC6677", "#9970AB"))+
    ggplot2::theme(
      plot.margin = grid::unit(c(0,0,0,0), "lines")
    )
}
