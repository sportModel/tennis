require(html)

# ATP ---------------------------------------------------------------------
load("psm/atp/2016.RData")

# Start of tournament
url <- "http://www.atpworldtour.com/en/scores/current/toronto/421/draws"
res <- urlTour(url, "Hard", sets=3)
tourTable(res, "_posts/tab/toronto2016m1")

# R16
res <- urlTour(url, "Hard", sets=3, roundID="V3")
#tourTable(res, "_posts/tab/montecarlo2016b")

# WTA ---------------------------------------------------------------------
load("psm/wta/2016.RData")
url <- "http://www.wtatennis.com/SEWTATour-Archive/posting/2016/806/MDS.pdf"
res <- urlTour(url, "Hard", sets=3, lines=114:177)
tourTable(res, "_posts/tab/toronto2016w1")
