pageextension 50128 "ShippingAgentEx" extends "Shipping Agents"
{
    layout
    {
        // Add changes to page layout here

        addafter(Name)
        {
            field(IN_CostPerPound; rec.IN_CostPerPound)
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