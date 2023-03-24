pageextension 50141 "PostedSalesInvoiceListEx" extends "Posted Sales Invoices"
{
    layout
    {
        addafter("Due Date")
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
        addafter(Invoice)
        {
            action("Check Freight & Shippping Code")
            {
                ApplicationArea = Basic, Suite;
                Caption = '"Check Freight & Shippping Code';
                Ellipsis = true;
                Image = Find;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin

                    postSalesOrder.CheckFreightShpCodeFromListProcedure();



                end;
            }
        }

        addafter(Print)
        {
            action("Print WCA Report")
            {

                Caption = 'Print WCA Report';
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedCategory = Category6;


                Ellipsis = true;
                Image = Print;



                trigger OnAction()
                var
                    WCASalesInv: Report WCASalesInvoice;
                begin

                    rec.SetFilter("No.", '=%1', rec."No.");
                    rec.SetFilter("Bill-to Customer No.", '=%1', rec."Bill-to Customer No.");


                    WCASalesInv.SetTableView(Rec);
                    WCASalesInv.Run();

                end;



            }

            action("Print Contract Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Print Contract Invoice';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category7;

                trigger OnAction()
                begin


                    rec.SetRange("No.", Rec."No.");
                    rec.SetRange("Bill-to Customer No.", rec."Bill-to Customer No.");
                    ContractInvReport.SetTableView(Rec);

                    ContractInvReport.Run();




                end;

            }


            action("Email Contract Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Email Contract Invoice';
                Ellipsis = true;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                    reportSelection: Record "Report Selections";
                    ReportSelectionSales: Page "Report Selection - Sales";
                    CurrRecordPage: Record "Sales Invoice Header";

                    email: Record "Email Item";
                begin
                    //SalesInvHeader := Rec;
                    //CurrPage.SetTableView(Rec);

                    rec.EmailContractRecords(true);


                end;
            }
        }

    }

    var
        postSalesOrder: Codeunit CheckFreightCU;
        ContractInvReport: report "BCS.WAT Sales Invoice";
}