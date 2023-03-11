# Define the server\

library(readr)
server <- function(input, output) {
    
    # Load data
    invoices <- readr::read_csv("invoices.csv")
    
    # Create reactive data
    invoice_data <- reactive({
        invoices %>%
            filter(client == input$client, date == input$date) %>%
            select(description, quantity, price, total)
    })
    
    # Output invoice table
    output$invoice_table <- renderTable({
        invoice_data()
    })
    
    # Download invoice as a CSV file
    output$download <- downloadHandler(
        filename = function() {
            paste(input$client, "-", format(input$date, "%Y-%m-%d"), ".csv", sep = "")
        },
        content = function(file) {
            write.csv(invoice_data(), file, row.names = FALSE)
        }
    )
}

