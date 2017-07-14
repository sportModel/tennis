require(html)

# Men's -------------------------------------------------------------------

load("psm/atp/2017.RData")
url <- "http://www.atpworldtour.com/en/scores/current/roland-garros/520/draws"

# Start of tournament
res <- urlTour(url, "Clay", sets=5)
tourTable(res, "_posts/tab/french2017m1")

# QF
res <- urlTour(url, "Grass", sets=5, roundID="V5")
tourTable(res, "_posts/tab/wimbledon2016m2")

# SF
res <- urlTour(url, "Grass", sets=5, roundID="V6")
tourTable(res, "_posts/tab/wimbledon2016m3")

# Women's -----------------------------------------------------------------

load("psm/wta/2016.RData")
url <- "http://www.wtatennis.com/SEWTATour-Archive/posting/2016/904/MDS.pdf"

# Start of tournament
res <- urlTour(url, "Grass", sets=3)
tourTable(res, "_posts/tab/wimbledon2016w1")
