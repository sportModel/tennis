import <- function(year, side=c("atp", "wta")) {
  Data <- NULL
  for (i in 1:length(year)) {
    f1 <- paste0("data/", side, "/", year[i], ".csv")
    f2 <- paste0("data/", side, "/", year[i], ".xls")
    f3 <- paste0("data/", side, "/", year[i], ".xlsx")
    if (file.exists(f1)) {
      Data.i <- suppressMessages(readr::read_csv(f1, na = c("", "N/A", "NA")))
    } else if (file.exists(f2)) {
      Data.i <- readxl::read_excel(f2, sheet=2, na = c("", "N/A", "NA"))
    } else if (file.exists(f3)) {
      Data.i <- readxl::read_excel(f3, na = c("", "N/A", "NA"))
    }
    if (class(Data.i$Date)[1] == 'character') {
      Data.i$Date <- lubridate::parse_date_time(Data.i$Date, orders=c("ymd", "mdy"))
    }
    names(Data.i)[grep("Best", names(Data.i))] <- "BestOf"
    Data.i <- Data.i[, c("Wsets", "Lsets", "Winner", "Loser", "Surface", "Date")]
    Data <- rbind(Data, Data.i)
  }

  #Data <- Data[!is.na(Wsets)]
  Data <- subset(Data, !is.na(Wsets) & !is.na(Lsets))
  Data$Winner <- FixName(Data$Winner)
  Data$Loser <- FixName(Data$Loser)

  PlayerID <- unique(c(Data$Winner, Data$Loser))
  #SurfaceID <- unique(Data$Surface)
  SurfaceID <- c("Hard", "Clay", "Grass")
  Winner <- match(Data$Winner, PlayerID)
  Loser <- match(Data$Loser, PlayerID)
  Surface <- match(Data$Surface, SurfaceID)
  monthChar <- month(Data$Date)
  monthChar[nchar(monthChar)==1] <- paste0("0", monthChar[nchar(monthChar)==1])
  TimeFactor <- as.factor(paste(year(Data$Date), monthChar, sep="-"))
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
