pageextension 50160 "PurchaseOrderEx" extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Print")
        {
            action("Print WCA Purchase Confirmation")
            {

                Caption = 'Print WCA Purchase Confirmation';
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedCategory = Category10;


                Ellipsis = true;
                Image = Print;



                trigger OnAction()
                var
                    WCAPurchaseConf: Report "WCA Purchase Order";
                begin

                    rec.SetFilter("Document Type", '=%1', "Document Type"::Order);
                    rec.SetFilter("No.", '=%1', rec."No.");
                    rec.SetFilter("Buy-from Vendor No.", '=%1', rec."Buy-from Vendor No.");


                    WCAPurchaseConf.SetTableView(Rec);
                    WCAPurchaseConf.Run();

                end;



            }
        }
    }

    var
        myInt: Integer;
}