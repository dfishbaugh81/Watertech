pageextension 50136 "SalesInvoiceSubformEx" extends "Sales Invoice Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Location Code")
        {

            /*

            field("Include Freight"; rec."Include Freight")
            {
                ApplicationArea = All;

                trigger OnValidate()
                var
                    SalesLinesTempRecord: Record SalesLineTempTable;
                begin

                    if not rec."Include Freight" then begin


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


            */

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


        */
}