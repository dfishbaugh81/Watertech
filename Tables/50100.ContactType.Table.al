table 50100 "ContactType"
{
    DataClassification = ToBeClassified;
    LookupPageId = ContactTypeList;


    fields
    {
        field(5; Type; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Type';

        }
    }

    keys
    {
        key(PK; Type)
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