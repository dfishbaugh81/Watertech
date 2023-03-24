table 50101 "ContactIndustry"
{
    DataClassification = ToBeClassified;
    Caption = 'Industry';
    LookupPageId = ContactIndustryList;

    fields
    {
        field(4; Industry; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Industry';
            Editable = true;

        }
    }

    keys
    {
        key(PK; Industry)
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