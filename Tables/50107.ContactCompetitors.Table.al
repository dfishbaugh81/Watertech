table 50107 "Contact_Competitors"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(7; "Contact No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Contact No.';
            TableRelation = Contact;

        }
        field(8; Competitor_Name; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Competitor Name';
            TableRelation = Competitor;

        }
    }

    keys
    {
        key(PK; "Contact No.", Competitor_Name)
        {
            Clustered = true;

        }

    }

}