import <- function(year, side=c("atp", "wta")) {
  Data <- NULL
  for (i in 1:length(year)) {
    f1 <- paste0("data/", side, "/", year[i], ".csv")
    f2 <- paste0("data/", side, "/", year[i], ".xls")
    f3 <- paste0("data/", side, "/", year[i], ".xlsx")
    if (file.exists(f1)) {
      Data.i <- read.csv(f1, stringsAsFactors=FALSE)
    } else if (file.exists(f2)) {
      Data.i <- readxl::read_excel(f2, na="", sheet=2)
    } else if (file.exists(f3)) {
      Data.i <- readxl::read_excel(f3, na="N/A")
    }
    names(Data.i)[grep("Best", names(Data.i))] <- "BestOf"
    Data.i <- Data.i[,!(names(Data.i) %in% c("SJW", "SJL"))]
    Data <- rbind(Data, Data.i)
  }

  Data <- subset(Data, !is.na(Data$Wsets))
  Data$Winner <- FixName(Data$Winner)
  Data$Loser <- FixName(Data$Loser)

  PlayerID <- unique(c(Data$Winner, Data$Loser))
  #SurfaceID <- unique(Data$Surface)
  SurfaceID <- c("Hard", "Clay", "Grass")
  Winner <- match(Data$Winner, PlayerID)
  Loser <- match(Data$Loser, PlayerID)
  Surface <- match(Data$Surface, SurfaceID)
  suppressMessages(require(lubridate))
  Date <- parse_date_time(Data$Date, orders=c("ymd", "mdy"))
  monthChar <- month(Date)
  monthChar[nchar(monthChar)==1] <- paste0("0", monthChar[nchar(monthChar)==1])
  TimeFactor <- as.factor(paste(year(Date), monthChar, sep="-"))
  Time <- as.numeric(TimeFactor)
  TimeID <- levels(TimeFactor)
  list(Data=Data, PlayerID=PlayerID, SurfaceID=SurfaceID, TimeID=TimeID, Winner=Winner, Loser=Loser, Surface=Surface, Time=Time)
}
FixName <- function(x) {
  y <- x
  for (i in 1:length(x)) {
    if (x[i] %in% .fixNames[,1]) {
      y[i] <- .fixNames[.fixNames[,1]==x[i],2]
    }
  }
  y
}
