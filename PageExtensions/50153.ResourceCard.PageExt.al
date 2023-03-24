pageextension 50153 "ResourceCardEx" extends "Resource Card"
{
    layout
    {
        // Add changes to page layout here

        addafter("Time Sheet Approver User ID")
        {
            field(ResourceCatCode; rec.ResourceCatCode)
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