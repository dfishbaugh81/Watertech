table 50106 "OpportunitySourceTable"
{

    DataClassification = ToBeClassified;
    LookupPageId = OpportunitySourcePage;

    fields
    {
        field(9; OpportunitySource; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Opportunity Source';

        }
    }

    keys
    {
        key(PK; OpportunitySource)
        {
            Clustered = true;
        }
    }

}