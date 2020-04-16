#' gapr: Estimate distributional gaps (differences) from count data
#'
#' This is a small package designed to estimate distributional gaps in terms
#' of an effect sizes, along with the associated standard error, using only
#' count data from each distribution. This assumes that the counts are from
#' ordered bins. The ECDF from each distribution is first approximated using
#' these counts (cummulative proportion within each bin). The ECDF's are then
#' paired and a smoothed curve is estimated using maximum likelihood. The area
#' under the curve is then estimated and transformed to an effect size. The
#' variance-covariance matrix associated with the curve fit is also used to
#' estimate the standard error of the effect size. For more information, please
#' see \href{Ho & Reardon (2012)}{https://journals.sagepub.com/doi/abs/10.3102/1076998611411918?journalCode=jebb}
#' and \href{Reardon & Ho (2015)}{https://journals.sagepub.com/doi/10.3102/1076998615570944}.
#'

#' @keywords internal
#' @importFrom RJafroc Df2RJafrocDataset FitBinormalRoc
#' @importFrom purrr safely
#' @importFrom stats qnorm

"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL
