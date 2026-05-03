#' Metadata for benthic quadrat images
#'
#' This dataset contains metadata for quadrat photographs collected along
#' transects across multiple coral reef habitats.
#'
#' @format A data frame with the following columns:
#' \describe{
#'   \item{Image.name}{Image filename}
#'   \item{Site}{Sampling site code}
#'   \item{Date}{Date of image collection}
#'   \item{Transect}{Transect identifier}
#'   \item{Quadrat}{Quadrat number within transect}
#' }
#'
#' @source Coral reef field surveys
#' @usage data(metadata)
"metadata"
#' Percent cover data for benthic categories
#'
#' This dataset contains percent cover estimates of benthic functional groups
#' and taxa derived from CoralNet image analysis.
#'
#' @format A data frame where each row corresponds to a quadrat image and
#' columns represent percent cover of benthic categories.
#'
#' @source CoralNet annotations of coral reef images
#' @usage data(per.cover.data)
"per.cover.data"
