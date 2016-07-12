fixName <- function(x) {
  y <- rep("", length(x))
  x <- gsub("\\xa0", " ", x) ## Fix non-breaking space issue
  for (i in 1:length(x)) {
    z <- gsub(" \\(.*", "", x[i])
    if (z %in% .specialNames[,1]) {
      y[i] <- .specialNames[.specialNames[,1]==z,2]
    } else {
      z <- unlist(strsplit(z, " "))
      y[i] <- paste0(z[2], " ", first <- substr(z[1], 1, 1), ".")
    }
  }
  y
}
