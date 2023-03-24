table 50110 "SalesLineTempTable"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; IN_DocNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No.';

        }

        field(2; IN_ItemNo; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item No.';
        }

        field(3; IN_ShippingAgent; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Shipping Agent';
        }

        field(4; IN_IncludeFreight; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Include Freight';


        }

        field(5; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Line No.';
        }
        /*
                field(6; ShippingAgentName; Text[30])
                {
                    DataClassification = ToBeClassified;
                    Caption = 'Shipping Agent Name';
                    //TableRelation = "Shipping Agent".Name where(Code = field(IN_ShippingAgent));
                }
        */

    }

    keys
    {
        key(Key1; IN_DocNo, "Line No.")
        {
            Clustered = true;
        }
    }


    var
        SalesLinesTempTable: Record SalesLineTempTable;


    trigger OnInsert()
    var

        NextLineNo: Integer;

    begin

        SalesLinesTempTable.Reset;

        if SalesLinesTempTable.FindLast then
            NextLineNo := SalesLinesTempTable."Line No." + 10000

        else
            NextLineNo := 10000;


        SalesLinesTempTable.Init();


        SalesLinesTempTable."Line No." := NextLineNo;
        Message('Record Inserted!');
        SalesLinesTempTable.Modify;

    end;

    trigger OnModify()
    begin

        Message('Trying to modify');

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}