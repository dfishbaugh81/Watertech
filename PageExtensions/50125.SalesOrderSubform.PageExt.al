pageextension 50125 "SaleOrderLineEx" extends "Sales Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Location Code")
        {
            field("Include Freight"; rec."Include Freight")
            {
                ApplicationArea = All;

                //the following trigger deletes temptable re3cord if Check Freight checkbox is not checked

                trigger OnValidate()
                var
                    SalesLinesTempRecord: Record SalesLineTempTable;
                begin

                    if (not rec."Include Freight") OR (Rec."Shipping Agent Code" = '') then begin


                        SalesLinesTempRecord.SetFilter(IN_DocNo, '=%1', rec."Document No.");

                        if SalesLinesTempRecord.FindSet then begin


                            SalesLinesTempRecord.SetFilter("Line No.", '=%1', Rec."Line No.");

                            if SalesLinesTempRecord.FindSet then begin

                                SalesLinesTempRecord.Delete;
                            end;


                        end;

                    end;

                end;

            }


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


    trigger OnModifyRecord(): Boolean
    var
        SalesLinesToTempTable: Codeunit PostSalesOrder;
        CustSpecialDiscount: Record "Sales Price";

        ItemCat: Record Item;

    begin

        SalesLinesToTempTable.SalesOrderLinesToTempTable_2(Rec);
        case rec.Type of
            rec.Type::Item:
                begin

                    CustSpecialDiscount.SetFilter("Sales Code", '=%1', rec."Sell-to Customer No.");
                    if CustSpecialDiscount.FindSet then begin

                        CustSpecialDiscount.SetFilter("Item No.", '=%1', rec."No.");

                        if CustSpecialDiscount.FindSet then begin

                            exit;
                        end

                        else begin
                            ItemCat.SetFilter("No.", '=%1', rec."No.");

                            if ItemCat.FindSet then begin

                                ItemCat.SetFilter("Item Category Code", '%1', '@CHEM*');

                                if ItemCat.FindSet then begin

                                    Message('No pricing record exists for customer %1, item %2', rec."Sell-to Customer No.", rec."No.");
                                end;

                            end;

                        end;

                    end;

                end;

        end
    end;



    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        SalesLinesToTempTable: Codeunit PostSalesOrder;

    begin

        SalesLinesToTempTable.SalesOrderLinesToTempTable_2(Rec);

    end;


    trigger OnDeleteRecord(): Boolean
    var
        SalesLinesTempRecord: Record SalesLineTempTable;

    begin

        SalesLinesTempRecord.SetFilter(IN_DocNo, '=%1', rec."Document No.");

        if SalesLinesTempRecord.FindSet then begin


            SalesLinesTempRecord.SetFilter("Line No.", '=%1', Rec."Line No.");

            if SalesLinesTempRecord.FindSet then begin

                SalesLinesTempRecord.Delete;
            end;


        end;


    end;


}