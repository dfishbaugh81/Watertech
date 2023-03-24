pageextension 50135 "SaleCrMemoHeader" extends "Sales Credit Memo"
{
    layout
    {
        addafter("Applies-to ID")
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
        modify(Post)
        {


            trigger OnAfterAction()
            var

            begin

                PostSalesCrMemo.TempTableToPostedSalesCreditMemoLines(rec);

            end;



        }


        modify(PostAndSend)
        {
            trigger OnAfterAction()
            var

            begin

                PostSalesCrMemo.TempTableToPostedSalesCreditMemoLines(Rec);


            end;
        }
    }

    var
        PostSalesCrMemo: Codeunit PostSalesOrder;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        FromSalesInvoiceField: Record "Sales Header";
    begin

        if rec."Applies-to Doc. No." <> '' then begin

            FromSalesInvoiceField.CalcFields(IMP_JobType);
            rec.TransferFields(FromSalesInvoiceField);
            rec.Insert();
        end;



    end;

}