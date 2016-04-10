tourTable <- function(res, name) {
  d <- length(res)
  n <- length(res[[d]][[1]])
  Tab <- matrix(NA, n, d)
  rownames(Tab) <- names(res[[d]][[1]])
  for (i in 1:d) {
    for (j in 1:length(res[[i]])) {
      n.j <- length(res[[i]][[j]])
      ind <- 1:n.j + (j-1)*n.j
      Tab[ind,i] <- res[[i]][[j]]
    }
  }
  colnames(Tab)[(d-3):d] <- c("Quarterfinal", "Semifinal", "Final", "Winner")
  colnames(Tab)[1:(d-4)] <- paste0("R", n/2^(1:(d-4)-1))
  Tab <- Tab[order(Tab[,"Winner"], decreasing=TRUE),]
  Tab <- Tab[!(substr(rownames(Tab), 1, 3)=="NA "),]
  print(htmlTable(Tab, class="\"sortable ctable\""), name=name)
}
