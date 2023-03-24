table 50102 "Competitor"
{
    DataClassification = ToBeClassified;
    LookupPageId = CompetitorList;

    fields
    {
        field(1; CompetitorName; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Competitor Name';

        }
    }

    /*    keys
        {
            key(PK; CompetitorName)
            {
                Clustered = true;
            }
        }
        */

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