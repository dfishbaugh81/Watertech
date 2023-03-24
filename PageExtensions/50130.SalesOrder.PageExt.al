#pragma implicitwith disable
pageextension 50130 "SalesOrderHeaderEx" extends "Sales Order"
{
    layout
    {
        addafter("Assigned User ID")
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
                PostSalesOrder: Codeunit PostSalesOrder;
                SetDate: Codeunit SetTodaysDateCU;
            begin
                SetDate.SetTodaysDate(Rec);
                PostSalesOrder.TempTableToPostedSalesOrderLines(Rec);

            end;



        }

        modify(PostAndNew)
        {
            trigger OnAfterAction()
            var
                PostSalesOrder: Codeunit PostSalesOrder;
            begin

                PostSalesOrder.TempTableToPostedSalesOrderLines(Rec);


            end;
        }

        modify(PostAndSend)
        {
            trigger OnAfterAction()
            var
                PostSalesOrder: Codeunit PostSalesOrder;
            begin

                PostSalesOrder.TempTableToPostedSalesOrderLines(Rec);


            end;
        }



        addafter("Work Order")
        {
            action("Print WCA Confirmation")
            {

                Caption = 'Print WCA Confirmation';
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedCategory = Category11;


                Ellipsis = true;
                Image = Print;



                trigger OnAction()
                var
                    WCAOrderConf: Report WCA_OrderConfReport;
                begin

                    rec.SetFilter("Document Type", '=%1', Rec."Document Type"::Order);
                    rec.SetFilter("No.", '=%1', rec."No.");
                    rec.SetFilter("Bill-to Customer No.", '=%1', rec."Bill-to Customer No.");


                    WCAOrderConf.SetTableView(Rec);
                    WCAOrderConf.Run();

                end;



            }
        }

    }

    var
        TempRecord: Record "Sales Line";

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        FromQuoteField: Record "Sales Header";
    begin

        if rec."Quote No." <> '' then begin

            FromQuoteField.CalcFields(IMP_JobType);
            rec.TransferFields(FromQuoteField);
            rec.Insert();

        end;



    end;

}
#pragma implicitwith restore
