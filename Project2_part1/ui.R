
library(shiny)
library(shinydashboard)
library(tidyverse)
library(readr)


raw.data <- read_csv("rawdata.csv")
tidy.data <- read_csv("tidydata.csv")

dashboardPage(
  dashboardHeader(title ="Project 2 - Part 1"),
  dashboardSidebar(
    dateRangeInput("time", "Choose Time",
                   start = "1987/12/05",
                   end = "2017-12-31")
  ),
  dashboardBody(
    fluidRow(
      box(title = "time series",
          width = 12,
          plotOutput("timeseries")
          )
    ),
    fluidRow(
      box(title = "air temperature",
          plotOutput("a.trend")
          ),
      box(title = "sea temperature",
          plotOutput("s.trend")
          )
    )
  )
)

