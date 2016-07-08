makePrior <- function(ID, side, year) {
  load(paste0("psm/", side, "/", year-1, ".RData"))
  ind <- match(ID, rownames(Eta))
  new <- is.na(ind)
  muEta <- Eta[ind, ncol(Eta)]
  tauEta <- sdEta[ind, ncol(Eta)]^(-2)
  muAlpha <- Alpha[ind, ]
  tauAlpha <- sdAlpha[ind, ]^(-2)
  muEta[new] <- tauEta[new] <- 0
  muAlpha[new,] <- tauAlpha[new,] <- 0

  list(muEta=muEta, tauEta=tauEta, muAlpha=muAlpha, tauAlpha=tauAlpha, rss=rss, tdf=tdf, new=1*new)
}
