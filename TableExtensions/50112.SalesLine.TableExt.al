tableextension 50112 "SalesOrderLineEx" extends "Sales Line"
{
    fields
    {
        // Add changes to table fields here
        field(50112; "Include Freight"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Include Freight';
        }

        field(50116; UserOverride; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'User Override';


        }





    }

    var
        myInt: Integer;



    trigger OnModify()
    var
        SalesLineTempTable: Codeunit PostSalesOrder;

        SalesLinesTempRecord: Record SalesLineTempTable;

        shippingAgentName: Record "Shipping Agent";

    begin

        SalesLinesTempRecord.SetFilter(IN_DocNo, '=%1', rec."Document No.");

        if SalesLinesTempRecord.FindSet then begin


            SalesLinesTempRecord.SetFilter("Line No.", '=%1', Rec."Line No.");

            if SalesLinesTempRecord.FindSet then begin

                SalesLinesTempRecord.Delete;

                SalesLineTempTable.SalesOrderLinesToTempTable_2(Rec);
            end;


        end;


    end;


}