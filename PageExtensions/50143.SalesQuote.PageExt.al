pageextension 50143 "SalesQuoteDocEx" extends "Sales Quote"
{
    layout
    {
        // Add changes to page layout here

        addafter("Assigned User ID")
        {
            field(IMP_JobType; Rec.IMP_JobType)
            {
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        // Add changes to page actions here
        modify(MakeOrder)
        {
            trigger OnAfterAction()
            var
                SalesHeaderRec: Record "Sales Header";

            begin

                SalesHeaderRec.SetFilter(SalesHeaderRec."Quote No.", '=%1', rec."No.");


                if SalesHeaderRec.FindSet then begin

                    SalesHeaderRec.Validate(SalesHeaderRec."Document Date", Today);
                    SalesHeaderRec.Validate(SalesHeaderRec."Order Date", Today);

                    SalesHeaderRec.Modify;

                end;



            end;
        }

    }

    var
        myInt: Integer;
}