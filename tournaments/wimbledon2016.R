require(html)

# Men's -------------------------------------------------------------------

load("psm/atp/2016.RData")
url <- "http://www.atpworldtour.com/en/scores/current/wimbledon/540/draws"

# Start of tournament
res <- urlTour(url, "Grass", sets=5)
tourTable(res, "_posts/tab/wimbledon2016m1")

# QF
res <- urlTour(url, "Grass", sets=5, roundID="V5")
tourTable(res, "_posts/tab/wimbledon2016m2")

# SF
res <- urlTour(url, "Grass", sets=5, roundID="V6")
tourTable(res, "_posts/tab/wimbledon2016m3")

# Women's -----------------------------------------------------------------

load("psm/wta/2016.RData")
url <- "http://www.atpworldtour.com/en/scores/current/wimbledon/540/draws"

# Start of tournament
res <- urlTour(url, "Grass", sets=5)
tourTable(res, "_posts/tab/wimbledon2016w1")
