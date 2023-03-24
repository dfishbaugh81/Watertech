reportextension 50102 "SalesInvoiceEx" extends "Standard Sales - Invoice"
{
    dataset
    {
        // Add changes to dataitems and columns here
        add(line)
        {
            column(IN_ShippingAgentCode; IN_ShippingAgentCode)
            {

            }

            column(IN_ShippingAgentName; IN_shippingAgentName)
            {

            }


        }
    }

    requestpage
    {
        // Add changes to the requestpage here
    }
}