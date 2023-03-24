tableextension 50100 "ContactEx" extends Contact
{
    fields
    {
        // Add changes to table fields here
        modify("Organizational Level Code")
        {
            Caption = 'Role';
        }
        //Remove ContactIndustry Field
        field(50100; ContactIndustry; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Industry';
            TableRelation = ContactIndustry;


        }

        field(50101; ContactCompanyType; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Company Type';
            TableRelation = ContactType;
            ValidateTableRelation = false;
        }

        field(50102; ContactDoNotSolicit; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Do Not Solicit';

        }

        field(50103; ContactLatitude; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Latitude';
        }

        field(50104; ContactLongitude; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Longitude';
        }

        field(50105; ContactSource; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Source';
        }

        field(50106; "Created On"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Created On';
        }

        field(50107; Contact_industryType; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Industry Type';
            TableRelation = IndustryType;

        }

        field(50108; ContactsLeadScore; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Lead Score';
        }

        field(50109; "Job Position"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Job Position';
        }

        field(50114; IMP_ContractTypes; Enum Imp_ContractTypes)
        {
            DataClassification = ToBeClassified;
            Caption = 'Contract Types';
        }


        field(50115; IMP_CustomerName; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "LEP Contract"."Partner Name";

        }

        field(50116; IMP_ContractStatus; Enum IMP_ContractStatus)
        {
            DataClassification = ToBeClassified;
            Caption = 'Contract Status';
        }

        modify("First Name")
        {
            Caption = 'First Name';
        }

        modify(Surname)
        {
            Caption = 'Last Name';
        }



    }

    trigger OnInsert()
    var
        myInt: Integer;
        CurrDate: Date;
    begin
        CurrDate := Today();
        "Created On" := CurrDate;

    end;
}
