table 50111 "IndustryType"

{
    DataClassification = ToBeClassified;
    LookupPageId = IndustryType;

    fields
    {
        field(6; SalesPerson_IndustryType; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Industry Type';

        }
    }

    keys
    {
        key(PK; SalesPerson_IndustryType)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}