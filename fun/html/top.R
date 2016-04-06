top <- function(psm, name) {
  Tab <- as.data.frame(psm$Delta + psm$Alpha)
  m <- ncol(psm$Eta)
  Tab$Last12mo <- psm$Delta - psm$Eta[,m-12]
  Tab$Last3mo <- psm$Delta - psm$Eta[,m-3]
  Tab$Overall <- psm$Delta
  Tab <- Tab[order(Tab$Overall, decreasing=TRUE)[1:100],]
  print(htmlTable(Tab, class="\"sortable ctable\""), name=name)
}
