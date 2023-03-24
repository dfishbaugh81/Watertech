pageextension 50133 "SalesCrMemoLinesEx" extends "Sales Cr. Memo Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Quantity)
        {
            field("Include Freight"; rec."Include Freight")
            {
                ApplicationArea = All;

                trigger OnValidate()
                var
                    SalesLinesTempRecord: Record SalesLineTempTable;
                begin

                    if (not rec."Include Freight") or (rec."Shipping Agent Code" = '') then begin


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

            field("Shipping Agent Code"; Rec."Shipping Agent Code")
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

    begin

        SalesLinesToTempTable.SalesOrderLinesToTempTable_2(Rec);

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