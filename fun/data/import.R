import <- function(year, set=c("atp", "wta")) {
  Data <- NULL
  for (i in 1:length(year)) {
    f1 <- paste0("data/", set, "/", year[i], ".csv")
    f2 <- paste0("data/", set, "/", year[i], ".xlsx")
    if (file.exists(f1)) {
      Data.i <- read.csv(f1, stringsAsFactors=FALSE)
    } else {
      require(readxl)
      Data.i <- read_excel(f2)
    }
    names(Data.i)[grep("Best", names(Data.i))] <- "BestOf"
    Data.i <- Data.i[,!(names(Data.i) %in% c("SJW", "SJL"))]
    Data <- rbind(Data, Data.i)
  }

  Data <- subset(Data, !is.na(Data$Wsets))
  Data$Winner <- FixName(Data$Winner)
  Data$Loser <- FixName(Data$Loser)

  PlayerID <- unique(c(Data$Winner, Data$Loser))
  SurfaceID <- unique(Data$Surface)
  Winner <- match(Data$Winner, PlayerID)
  Loser <- match(Data$Loser, PlayerID)
  Surface <- match(Data$Surface, SurfaceID)
  require(lubridate)
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
