table 50105 "OpportunitySource_Opportunity"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(7; "Opportunity No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Opportunity No.';
            TableRelation = Opportunity;

        }
        field(8; OpportunitySource; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Opportunity Source';
            TableRelation = OpportunitySourceTable;

        }
    }

    keys
    {
        key(PK; "Opportunity No.", OpportunitySource)
        {
            Clustered = true;

        }




    }

}