library(shinydashboard)
library(shiny)
library(tidyverse)
library(readr)


raw.data <- read_csv("rawdata.csv")
tidy.data <- read_csv("tidydata.csv")

shinyServer(function(input, output) {

  output$timeseries <- renderPlot({
    
    ggplot(data = tidy.data[c(as.numeric(input$time[1]-6546):as.numeric(input$time[2]-7107), as.numeric(input$time[1]-6546+10424):as.numeric(input$time[2]-7107+10424)),], aes(x=date, y=Celsius, color = Temp))+geom_line()+
      xlab("Year") +
      ylab("Temperature") +
      ggtitle("Temperature over time")
    
  })
  
  output$a.trend <- renderPlot({
    
    ggplot(data = raw.data[as.numeric(input$time[1]-6546):as.numeric(input$time[2]-7107),], aes(x = date, y=ATMP))+
      geom_line()+
      stat_smooth(method = lm)+
      xlab("Year")+
      ylab("Temperature(Celcius)")+
      ggtitle("air")
    
  })
  
  output$s.trend <- renderPlot({
    ggplot(data = raw.data[as.numeric(input$time[1])-6546:as.numeric(input$time[2])-6546,], aes(x = date, y=WTMP))+
      geom_line()+
      stat_smooth(method = lm)+
      xlab("Year")+
      ylab("Temperature(Celcius)")+
      ggtitle("sea")
    
  })
   
})
