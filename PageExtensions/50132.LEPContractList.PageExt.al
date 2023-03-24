pageextension 50132 "LEPContractsEx" extends "LEP Contract List"
{
    layout
    {
        // Add changes to page layout here

        addafter("Customer No.")
        {
            field(IMP_CustomerName; rec."Partner Name")
            {
                ApplicationArea = All;
                Caption = 'Customer Name';

            }

        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
}