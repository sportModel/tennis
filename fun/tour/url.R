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

urlTour <- function(url, surface="Hard", sets=5, just.bracket=FALSE, roundID) {
  require(XML)
  p <- NULL
  for (i in 1:length(url)) {
    tab <- readHTMLTable(url[i], header=FALSE, stringsAsFactors=FALSE)
    if (length(tab)==35) {
      if (missing(roundID)) {
        tab <- tab[-(1:3)]
      } else {
        raw <- tab$scoresDrawTable[,roundID]
        raw <- raw[grep("H2H", raw)]
        raw <- gsub("\\r", "", raw)
        raw <- gsub("\\n", "", raw)
        raw <- gsub("\\t", "", raw)
        raw <- gsub("H2H", "", raw)
        raw <- gsub("[[:digit:]]+", "", raw)
        raw <- trimws(raw)
        n <- length(raw)/2
        tab <- vector("list", n)
        for (i in 1:n) {
          tab[[i]] <- matrix("NA", 3, 2)
          tab[[i]][c(1,3),1] <- raw[1:2 + (i-1)*2]
        }
      }
    }
    n <- length(tab)
    P <- matrix("", 2, n)
    for (j in 1:n) {
      if (all(dim(tab[[j]]) == 2:3)) {
        tmp <- matrix(NA, 3, 2)
        tmp[1,1] <- tab[[j]][1,3]
        tmp[3,1] <- tab[[j]][2,3]
        tab[[j]] <- tmp
      }
      name <- tab[[j]][c(1,3),1]
      P[,j] <- fixName(name)
      }
    p <- c(p, as.character(P))
  }
  p <- p[p!= ' U.']
  if (just.bracket) return(p)
  predictTour(p, surface, Delta, Alpha, sets=sets)
}

bestMatch <- function(url, surface="Hard", n=3, sets=5) {
  res <- urlTour(url, surface, just.bracket=TRUE)
  x <- Delta + Alpha[, surface]
  D <- matrix(x[res], nrow=2)
  ind <- order(apply(D, 2, sum), decreasing=TRUE)[1:n]
  Names <- res[rep(ind*2, each=2) + rep(c(-1:0), n)]
  nm <- matrix(Names, ncol=2, byrow=TRUE)
  X <- matrix(x[Names], ncol=2, byrow=TRUE)
  X <- cbind(X, apply(X, 1, sum))
  X <- cbind(X, apply(apply(nm, 1, function(x) predictMatch(x[1], x[2], surface=surface, sets=sets)), 2, max))
  rownames(X) <- apply(nm, 1, paste, collapse=' v ')
  X
}
