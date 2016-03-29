###########
## Men's ##
###########
load("atp.RData")

## My top seeds
x <- head(sort(Delta + Alpha[, "Hard"], decreasing=TRUE), 16)
print(data.frame(Rank=1:length(x), Player=names(x), Ability=round(x, 2)), row.names=FALSE, right=FALSE)

##
res <- urlTour(c("http://www.usopen.org/en_US/scores/draws/ms/r1s1.html",
                 "http://www.usopen.org/en_US/scores/draws/ms/r1s2.html",
                 "http://www.usopen.org/en_US/scores/draws/ms/r1s3.html",
                 "http://www.usopen.org/en_US/scores/draws/ms/r1s4.html"), "Hard")

head(winnerProb(res))        ## Win
head(winnerProb(res, 6), 10) ## Finals
head(winnerProb(res, 5), 10) ## Semis
head(winnerProb(res, 4), 10) ## Quarters
round(100*sort(res[[4]][[5]], decreasing=TRUE), 1)
predictMatch("Kyrgios N.", "Murray A.", "Hard", verbose=TRUE)
predictMatch("Nishikori K.", "Paire B.", "Hard", verbose=TRUE)

# 2nd round
res <- urlTour(c("http://www.usopen.org/en_US/scores/draws/ms/r2s1.html",
                 "http://www.usopen.org/en_US/scores/draws/ms/r2s2.html"), "Hard")
round(100*sort(res[[3]][[1]], decreasing=TRUE), 1)
bestMatch("http://www.usopen.org/en_US/scores/draws/ms/r2s2.html", "Hard")

# 3nd round
res <- urlTour("http://www.usopen.org/en_US/scores/draws/ms/r3s1.html", "Hard")
round(100*sort(res[[2]][[1]], decreasing=TRUE), 1)

# R16
res <- urlTour("http://www.usopen.org/en_US/scores/draws/ms/r4s1.html", "Hard")
round(100*sort(res[[1]][[1]], decreasing=TRUE), 1)

# QF
res <- urlTour("http://www.usopen.org/en_US/scores/draws/ms/r5s1.html", "Hard")
round(100*sort(res[[1]][[1]], decreasing=TRUE), 1)

# SF
res <- urlTour("http://www.usopen.org/en_US/scores/draws/ms/r6s1.html", "Hard")
round(100*sort(res[[1]][[1]], decreasing=TRUE), 1)

#############
## Women's ##
#############
load("wta.RData")

## My top seeds
x <- head(sort(Delta + Alpha[, "Hard"], decreasing=TRUE), 32)
print(data.frame(Rank=1:length(x), Player=names(x), Ability=round(x, 2)), row.names=FALSE, right=FALSE)

res <- urlTour(c("http://www.usopen.org/en_US/scores/draws/ws/r1s1.html",
                 "http://www.usopen.org/en_US/scores/draws/ws/r1s2.html",
                 "http://www.usopen.org/en_US/scores/draws/ws/r1s3.html",
                 "http://www.usopen.org/en_US/scores/draws/ws/r1s4.html"), "Hard", sets=3)

head(winnerProb(res), 10)    ## Win
head(winnerProb(res, 6), 10) ## Finals
head(winnerProb(res, 5), 10) ## Semis
head(winnerProb(res, 4), 10) ## Quarters
round(100*sort(res[[4]][[1]], decreasing=TRUE), 1)

predictMatch("Williams V.", "Keys M.", "Hard", 3)
predictMatch("Cibulkova D.", "Ivanovic A.", "Hard", 3, verbose=TRUE)

# 2nd round
res <- urlTour(c("http://www.usopen.org/en_US/scores/draws/ws/r2s1.html",
                 "http://www.usopen.org/en_US/scores/draws/ws/r2s2.html"), "Hard", sets=3)
round(100*sort(res[[3]][[1]], decreasing=TRUE), 1)
bestMatch("http://www.usopen.org/en_US/scores/draws/ws/r2s2.html", "Hard")

# 3nd round
res <- urlTour("http://www.usopen.org/en_US/scores/draws/ws/r3s1.html", "Hard", sets=3)
round(100*sort(res[[2]][[1]], decreasing=TRUE), 1)
bestMatch("http://www.usopen.org/en_US/scores/draws/ws/r3s1.html", "Hard")

# R16
res <- urlTour("http://www.usopen.org/en_US/scores/draws/ws/r4s1.html", "Hard", sets=3)
round(100*sort(res[[1]][[1]], decreasing=TRUE), 1)

# QF
res <- urlTour("http://www.usopen.org/en_US/scores/draws/ws/r5s1.html", "Hard", sets=3)
round(100*sort(res[[1]][[1]], decreasing=TRUE), 1)

# SF
res <- urlTour("http://www.usopen.org/en_US/scores/draws/ws/r6s1.html", "Hard", sets=3)
round(100*sort(res[[1]][[1]], decreasing=TRUE), 1)
