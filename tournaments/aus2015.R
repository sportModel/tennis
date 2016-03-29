###########
## Men's ##
###########
load("atp.RData")

## My top seeds
x <- head(sort(Delta + Alpha[, "Hard"], decreasing=TRUE), 16)
print(data.frame(Rank=1:length(x), Player=names(x), Ability=round(x, 2)), row.names=FALSE, right=FALSE)

##
res <- urlTour(c("http://www.ausopen.com/en_AU/scores/draws/ms/r1s1.html",
                 "http://www.ausopen.com/en_AU/scores/draws/ms/r1s2.html",
                 "http://www.ausopen.com/en_AU/scores/draws/ms/r1s3.html",
                 "http://www.ausopen.com/en_AU/scores/draws/ms/r1s4.html"), "Hard")
winnerProb(res)


## Quarters
res <- urlTour("http://www.ausopen.com/en_AU/scores/draws/ms/r6s1.html", "Hard")
winnerProb(res)
res
x <- urlTour("http://www.ausopen.com/en_AU/scores/draws/ms/r6s1.html", just.bracket=TRUE)
x[3] <- "Bye"
predictTour(x, "Hard", Delta, Alpha)

#############
## Women's ##
#############
load("wta.RData")

## My top seeds
x <- head(sort(Delta + Alpha[, "Hard"], decreasing=TRUE), 32)
print(data.frame(Rank=1:length(x), Player=names(x), Ability=round(x, 2)), row.names=FALSE, right=FALSE)

res <- urlTour(c("http://www.ausopen.com/en_AU/scores/draws/ws/r1s1.html",
                 "http://www.ausopen.com/en_AU/scores/draws/ws/r1s2.html",
                 "http://www.ausopen.com/en_AU/scores/draws/ws/r1s3.html",
                 "http://www.ausopen.com/en_AU/scores/draws/ws/r1s4.html"), "Hard", 3)
winnerProb(res)
predictMatch("Williams S.", "Sharapova M.", "Hard", 3)
predictMatch("Williams V.", "Keys M.", "Hard", 3)
