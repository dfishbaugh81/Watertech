pageextension 50126 "JobEx" extends "Job Card"
{
    layout
    {
        // Add changes to page layout here

        addafter("Project Manager")
        {
            field(MyField; rec.JobTypes)
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