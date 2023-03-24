pageextension 50147 "PostedSalesCreditMemDocEx" extends "Posted Sales Credit Memo"
{
    layout
    {
        // Add changes to page layout here
        addafter("No. Printed")
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

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        FromCreditMemoField: Record "Sales Header";
    begin



        FromCreditMemoField.CalcFields(IMP_JobType);
        rec.TransferFields(FromCreditMemoField);
        rec.Insert();

    end;
}