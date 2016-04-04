convert <- function(fit) {
  require(coda)
  MCMC <- as.mcmc.list(fit) ## Convert to coda format
  require(R2jags)
  R2jags:::mcmc2bugs(MCMC, program="jags") ## Convert to R2jags format
}
