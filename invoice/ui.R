# Load necessary libraries
library(shiny)
library(dplyr)

# Define the UI
ui <- fluidPage(
    
    # Input section
    sidebarLayout(
        sidebarPanel(
            selectInput("client", "Select client:", choices = unique(invoices$client)),
            dateInput("date", "Select date:", value = Sys.Date())
        ),
        
        # Output section
        mainPanel(
            tableOutput("invoice_table"),
            downloadButton("download", "Download invoice")
        )
    )
)

