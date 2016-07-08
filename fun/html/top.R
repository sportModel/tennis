top <- function(psm, name, n=100) {
  Tab <- as.data.frame(psm$Delta + psm$Alpha)
  m <- ncol(psm$Eta)
  Tab$Last12mo <- psm$Delta - psm$Eta[,m-12]
  Tab$Last3mo <- psm$Delta - psm$Eta[,m-3]
  Tab$Overall <- apply(Tab[,1:3], 1, mean)
  Tab <- Tab[order(Tab$Overall, decreasing=TRUE)[1:n],]
  print(htmlTable(Tab, class="\"sortable ctable\""), name=name)
}
