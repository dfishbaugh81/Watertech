tableextension 50107 "UserSetupEx" extends "User Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50100; ContactOpportunityFilter; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Contacts/Opportunities Filter';
        }

        field(50128; ResourceFilter; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Resource Filter';
        }
    }

    var
        myInt: Integer;
}