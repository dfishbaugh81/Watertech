tableextension 50116 "PurchaseLineEx" extends "Purchase Line"
{
    fields
    {
        // Add changes to table fields here

        field(50116; UserOverride; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'User Override';


            trigger OnValidate()
            var
                ItemUnitCost: Record Item;
            begin
                ItemUnitCost.Reset();
                if ItemUnitCost.Get("No.") then begin
                    if UserOverride then begin
                        Validate("Direct Unit Cost", ItemUnitCost.WatertechStandardCost * "Qty. per Unit of Measure");
                        Modify(true);
                    end else begin
                        Validate("Direct Unit Cost", ItemUnitCost."Unit Cost" * "Qty. per Unit of Measure");
                        Modify(true);
                    end;
                end;
            end;


        }





    }

    var
        myInt: Integer;



    trigger OnInsert()
    var
        itemWatertechCost: Record Item;
        PurchaseOrderRecord: Record "Purchase Header";
        TempDirectUnitCost: Decimal;
    begin

        itemWatertechCost.SetFilter(itemWatertechCost."No.", '=%1', Rec."No.");

        if itemWatertechCost.FindSet then begin


            //TempDirectUnitCost := itemWatertechCost.WatertechStandardCost * rec."Qty. per Unit of Measure";
            TempDirectUnitCost := itemWatertechCost.WatertechStandardCost;

            rec.Validate("Direct Unit Cost", TempDirectUnitCost);
            rec.UpdateAmounts();



        end;

    end;



    trigger OnModify()
    var
        itemWatertechCost: Record Item;
        PurchaseOrderRecord: Record "Purchase Header";
        TempDirectUnitCost: Decimal;

    begin



    end;

}