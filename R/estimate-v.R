safe_binormal <- safely(FitBinormalRoc)

fit_binormal <- function(data, g1, g2) {
  if(
    all(data[[g1]] == 0) |
     all(data[[g2]] == 0) |
     all(is.na(data[[g1]])) |
     all(is.na(data[[g2]]))
  ) {
    warning("All values of g1 or g2 are either missing or have counts of zero.")
    return(list())
  }

  prepped <- Df2RJafrocDataset(data[[g1]],
                               data[[g2]],
                               InputIsCountsTable = TRUE)
  safe_fit <- safe_binormal(prepped)
  if(!is.null(safe_fit$error)) {
    prepped <- Df2RJafrocDataset(data[[g2]],
                                 data[[g1]],
                                 InputIsCountsTable = TRUE)
    safe_fit <- safe_binormal(prepped)
    safe_fit$result$AUC <- 1 - safe_fit$result$AUC
  }
  safe_fit$result
}

extract_data <- function(fit) {
  if(!(length(fit) > 0)) {
    return(data.frame(auc = NA_real_, v = NA_real_, v_se = NA_real_))
  }
  auc <- fit$AUC

  a <- fit$a
  b <- fit$b

  first <- (2/(1 + b^2))*fit$covMat["a", "a"]
  second <- (2*a^2*b^2/((1+b^2))^3)*fit$covMat["b", "b"]
  third <- 4*a*b/((1 + b^2)^2)*fit$covMat["a", "b"]

  data.frame(auc = auc,
             v = sqrt(2)*qnorm(auc),
             v_se = first + second - third)


}

#' Estimates the effect size V and its standard error
#'
#' Uses maximum likelihood to estimate the ROC curve, estimates
#' the area under the curve, and returns the AUC, V and standard
#' error of V
#'
#' @param data The dataset used to estimate V
#' @param g1 count data the first group in each of $n$ categories
#' @param g2 count data the second group in each of $n$ categories
#' @export
estimate_v <- function(data, g1, g2) {
  extract_data(
    fit_binormal(data, g1, g2)
  )
}

