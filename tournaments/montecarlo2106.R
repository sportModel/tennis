require(html)
load("psm/atp.RData")
res <- urlTour("http://www.atpworldtour.com/en/scores/current/monte-carlo/410/draws",
               "Clay", sets=3)
tourTable(res, "_posts/tab/montecarlo2016a")

res <- urlTour("http://www.atpworldtour.com/en/scores/current/monte-carlo/410/draws",
               "Clay", sets=3, roundID="V3")
tourTable(res, "_posts/tab/montecarlo2016b")

# Individual matches
predictMatch("Djokovic N.", "Vesely J.", "Clay", 3, verbose=TRUE)
