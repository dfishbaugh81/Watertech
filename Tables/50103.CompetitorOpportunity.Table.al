table 50103 "CompetitorOpportunity"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(2; "Opportunity No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Opportunity No.';
            TableRelation = Opportunity;

        }
        field(3; Competitor_Name; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Competitor Name';
            TableRelation = Competitor;


        }
    }

    keys
    {

        key(PK; "Opportunity No.", Competitor_Name)
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