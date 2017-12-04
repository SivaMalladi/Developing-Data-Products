#Developing Data Products Week 4 - Project Assignment
#This app helps in selecting a car of your choice from mtcars dataset

#This is ui.R file for the shiny app

library(markdown)

shinyUI(navbarPage("Car of Your Choice...",
        tabPanel("CarList",
                   
        # Sidebar
        sidebarLayout( 
            sidebarPanel(
                helpText("Select Features of your choice"),
				radioButtons('am', 'Transmission Type:', choiceNames =list("Automatic", "Manual"), choiceValues = list(0,1)),
                checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
                sliderInput('mpg', 'Miles per Gallon', min=05, max=50, value=c(05,50), step=2)
            ),
            
            
            mainPanel(
               dataTableOutput('table')
            )
        )
),
        tabPanel("About",
            mainPanel(
                includeMarkdown("about.md")
            )
        )
    )
)   