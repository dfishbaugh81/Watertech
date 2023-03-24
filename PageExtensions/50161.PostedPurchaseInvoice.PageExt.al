pageextension 50161 "PostedPurchaseInvoicePageEx" extends "Posted Purchase Invoice"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter(Print)
        {
            action("Print WCA Purchase Confirmation")
            {

                Caption = 'Print WCA Purchase Confirmation';
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedCategory = Category5;


                Ellipsis = true;
                Image = Print;



                trigger OnAction()
                var
                    WCAPurchaseInv: Report "WCA Purchase Invoice";
                begin

                    rec.SetFilter("No.", '=%1', rec."No.");
                    rec.SetFilter("Buy-from Vendor No.", '=%1', rec."Buy-from Vendor No.");


                    WCAPurchaseInv.SetTableView(Rec);
                    WCAPurchaseInv.Run();

                end;



            }
        }
    }

    var
        myInt: Integer;
}