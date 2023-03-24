pageextension 50112 "OpportunitySubFormEx" extends "Opportunity Subform"
{
    layout
    {
        // Add changes to page layout here

        addafter("Estimated Close Date")
        {


            field(OpportunityModifiedDate; rec.OpportunityModifiedDate)
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