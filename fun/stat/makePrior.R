makePrior <- function(ID, side, year) {
  load(paste0("psm/", side, "/", year-1, ".RData"))
  ind <- match(ID, rownames(Eta))
  new <- 1*is.na(ind)
  
  list(muEta    = Eta[ind, ncol(Eta)],
       tauEta   = sdEta[ind, ncol(Eta)]^(-2),
       muAlpha  = Alpha[ind, ],
       tauAlpha = sdAlpha[ind, ]^(-2),
       rss      = rss,
       tdf      = tdf,
       new      = new)
}
