pageextension 50129 "PostedSalesInvoiceEx" extends "Posted Sales Invoice Subform"
{
    layout
    {
        // Add changes to page layout here

        addafter(Quantity)
        {
            field("Include Freight"; rec."Include Freight")
            {
                ApplicationArea = All;
                Editable = true;

            }

            field(IN_ShippingAgentCode; REC.IN_ShippingAgentCode)
            {
                ApplicationArea = All;
                Editable = true;


            }

            field(IN_ShippingAgentName; rec.IN_ShippingAgentName)
            {
                ApplicationArea = All;
                Editable = true;
            }




        }



    }

}