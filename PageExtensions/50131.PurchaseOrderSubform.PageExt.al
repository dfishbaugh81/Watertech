pageextension 50131 "PurchaseLineEx" extends "Purchase Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field(UserOverride; rec.UserOverride)
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

    /*

        trigger OnModifyRecord(): Boolean
        var
            itemWatertechCost: Record Item;
            PurchaseOrderRecord: Record "Purchase Header";
            TempDirectUnitCost: Decimal;
        begin

            itemWatertechCost.SetFilter(itemWatertechCost."No.", '=%1', Rec."No.");

            if itemWatertechCost.FindSet then begin


                TempDirectUnitCost := itemWatertechCost.WatertechStandardCost * rec."Qty. per Unit of Measure";

                rec.Validate("Direct Unit Cost", TempDirectUnitCost);

            end;

        end;

        */
}