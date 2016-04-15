require(html)
load("psm/atp.RData")

# Start of tournament
res <- urlTour("http://www.atpworldtour.com/en/scores/current/monte-carlo/410/draws",
               "Clay", sets=3)
tourTable(res, "_posts/tab/montecarlo2016a")

# R16
res <- urlTour("http://www.atpworldtour.com/en/scores/current/monte-carlo/410/draws",
               "Clay", sets=3, roundID="V3")
tourTable(res, "_posts/tab/montecarlo2016b")

# SF
res <- urlTour("http://www.atpworldtour.com/en/scores/current/monte-carlo/410/draws",
               "Clay", sets=3, roundID="V5")
tourTable(res, "_posts/tab/montecarlo2016c")

# Individual matches
predictMatch("Djokovic N.", "Vesely J.", "Clay", 3, verbose=TRUE)
predictMatch("Tsonga J.W.", "Federer R.", "Clay", 3, verbose=TRUE)
