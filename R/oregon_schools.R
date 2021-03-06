#' Oregon School Data
#'
#' A random sample (~25%) of publicly available data on the number of students
#' scoring in each of four performance categories by school on the statewide
#' test of English/Language Arts in Oregon during the 2014-2015 school year.
#' Numbers are reported separately for students coded as Hispanic/Latino and
#' White.
#'
#' @format A data frame with 3360 rows and 7 columns.
#'   \describe{
#'     \item{academic_year}{Character. Academic school year during which the data were collected.}
#' 	   \item{district}{Character. Name of the Oregon School District.}
#'     \item{school}{Character. Name of the Oregon School District.}
#' 	   \item{grade_level}{Character. The grade level corresponding to the counts in each level.}
#' 	   \item{level}{Double. Ordinal performance categories. 1 = low, 4 = high.}
#' 	   \item{hispanic_latino}{Double. Number of students coded Hispanic/Latino scoring in the given level for the corresponding grade_level and school.}
#'     \item{white}{Double. Number of students coded White scoring in the given level for the corresponding grade_level and school.}
#' }

"oregon_schools"
