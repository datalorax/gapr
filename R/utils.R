
# check that RJafroc is installed
check_rjafroc <- function() {
  chk <- "RJafroc" %in% installed.packages()
  if(isFALSE(chk)) {
    res <- yesno("The RJafroc package is not installed. Would you like to install it now?")
    if(res) {
      install_github("dpc10ster/RJafroc@78210b8c7f06526ce64ddf78006339f723bb63f6")
    }
  }
}

same_sha <- function(local_sha) {
  if(is.null(local_sha)) {
    local_sha <- 0
  }
  local_sha == "78210b8c7f06526ce64ddf78006339f723bb63f6"
}

check_sha <- function() {
  local_sha <- packageDescription("RJafroc", lib.loc = .libPaths())$GithubSHA1

  if(!same_sha(local_sha)) {
    if(yesno(paste0("The specific version of RJafroc you have installed",
                    " is not guaranteed to work with the current version of",
                    " gapr. Would you like to install a version that is",
                    "certain to work?"))) {
      install_github("dpc10ster/RJafroc@78210b8c7f06526ce64ddf78006339f723bb63f6")
      }
  }
}
check_sha()

