#EXPLORATORY DATA ANALYSIS WEEK 1

## Getting the required packages
required_packages <- c("data.table","parallel","lubridate","dplyr")
install_required <- setdiff(required_packages, rownames(installed.packages()))
if(length(install_required)!=0){install.packages(install_req)}
options(download.file.method = "libcurl")
sapply(required_packages,library,character.only=T,quietly=T)

## GETTING AND CLEANING THE DATA
url_download <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_data_hh_requiredtion.zip"

data_dir <- file.path(getwd(),"Data")
plot_dir <- file.path(getwd(),"Plots")
## Creation of Data Directory
if(!file.exists(data_dir))
{
  dir.create("Data")
}
##Creation of Plots Directory
if(!file.exists(plot_dir))
{
  dir.create("Plots")
}
if(!file.exists(file.path(data_dir,"assignment.zip")))
{
  download.file(url_download,dest=file.path(data_dir,"assignment.zip"),method = "curl")
}
unzip(file.path(data_dir,"assignment.zip"),overwrite=T,exdir = data_dir)

## Loading Data from the text file
data_hh <- fread(file.path(data_dir,"household_power_consumption.txt"),sep=";",colClasses="character")

head(data_hh)
## Converting the Date and Time formats in the required formats
data_hh$DateTimeFormat <- as.Date(data_hh$Date,format="%d/%m/%Y")

## Extracting the relevant data only
data_hh %>% filter(DateTimeFormat <= "2007-02-02 23:59:00" & DateTimeFormat >= "2007-02-01 00:00:00") -> data_hh_required
nrow(data_hh_required)
##Number of rows in required data set = 2 Days * 24 Hours * 60 Minutes = 2880 which matches
##Freeing the memory out of the bigger dataset data_hh
rm(data_hh)
data_hh_required$DateTimeFormat <- paste(data_hh_required$DateTimeFormat,data_hh_required$Time)
data_hh_required$DateTimeFormat <- ymd_hms(data_hh_required$DateTimeFormat)
##Converting all the columns into requisite datatype (numeric)
head(data_hh_required[,3:9])
for(i in 3:9)
{
  data_hh_required[,i] <- as.numeric(data_hh_required[,i])
}








