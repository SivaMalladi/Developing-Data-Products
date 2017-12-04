#Developing Data Products Week 4 - Project Assignment
#This app helps in selecting a car of your choice from mtcars dataset

#This is server.R file for the shiny app


library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {

    # Show the cars that correspond to the filters
    output$table <- renderDataTable({
        mpg_range <- seq.int(from = input$mpg[1], to = input$mpg[2], by = 0.1)
        data <- transmute(mtcars, Car = rownames(mtcars), 
		                          Transmission = am,
								  Cylinders = cyl,
								  MilesPerGallon = mpg
                          )
        data <- filter(data, Transmission %in% input$am,
							 Cylinders %in% input$cyl, 
							 MilesPerGallon %in% mpg_range)
        data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
        
        data
    }, options = list(lengthMenu = c(5, 15, 30), pageLength = 40))
})