pageextension 50124 "CustomerListPageEx" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
        addafter(Contact)
        {
            field(FreedomPlus; rec.FreedomPlus)
            {
                ApplicationArea = All;

            }

            field(FDALetter; rec.FDALetter)
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