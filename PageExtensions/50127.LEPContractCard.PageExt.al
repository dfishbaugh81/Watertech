pageextension 50127 "ContractEx" extends "LEP Contract Card"
{
    layout
    {
        // Add changes to page layout here
        addafter(Blocked)
        {
            field(IMP_ContractTypes; rec.IMP_ContractTypes)
            {
                ApplicationArea = All;

            }

            field(IMP_ContractStatus; Rec.IMP_ContractStatus)
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