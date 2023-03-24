pageextension 50148 "SAlesOrderListPageEx" extends "Sales Order List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Document Date")
        {
            field(IMP_JobType; rec.IMP_JobType)
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