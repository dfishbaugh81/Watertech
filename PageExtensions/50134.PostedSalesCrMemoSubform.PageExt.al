pageextension 50134 "PostedSalesCrMemoLine" extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Quantity)
        {
            field("Include Freight"; rec."Include Freight")
            {
                ApplicationArea = All;

            }

            field(IN_ShippingAgentCode; rec.INSalesCreditShippingAgentCode)
            {
                ApplicationArea = All;

            }

        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}