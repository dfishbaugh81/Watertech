tableextension 50118 "RequisitionWorkSheetEx" extends "Requisition Line"
{
    fields
    {
        // Add changes to table fields here
    }

    var
        itemRecord: Record Item;


    trigger OnInsert()
    var

    begin

        GetWatertechStdCost();

    end;


    trigger OnModify()
    var

    begin

        GetWatertechStdCost();

    end;


    //The following procedure sets a filter on the item's card based on the Requisition Worksheet item lines, gets the Watertech Standard Cost form the item and replaces the Direct Unit Cost with it.
    local procedure GetWatertechStdCost()
    var

    begin

        Case rec.Type of

            rec.Type::Item:

                begin

                    itemRecord.SetFilter(itemRecord."No.", '=%1', Rec."No.");

                    if itemRecord.FindSet then begin


                        if rec."Unit of Measure Code" <> itemRecord."Base Unit of Measure" then begin

                            rec.Validate("Direct Unit Cost", itemRecord.WatertechStandardCost * Rec."Qty. per Unit of Measure");

                        end
                        else
                            rec.Validate("Direct Unit Cost", itemRecord.WatertechStandardCost);



                    end;

                end;
        end;

    end;
}