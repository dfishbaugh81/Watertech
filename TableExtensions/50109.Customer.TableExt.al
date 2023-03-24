tableextension 50109 "CustomerEx" extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50120; ExpectedAnnualSales; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'EXPECTED Annual Sales ($)';
            DecimalPlaces = 2;

        }

        field(50110; ExpectedGP; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'EXPECTED GP %';
        }

        field(50111; ServiceVisitsPerYr; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Account Rep Visits per Year';
            DecimalPlaces = 2;
        }

        field(50112; HrsPerSrvcVisit; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Account Rep Hours per Visit';
            DecimalPlaces = 2;
        }

        field(50113; FreedomPlus; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Freedom Plus (Yes/No)';
        }

        field(50114; FDALetter; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'FDA Letter(Yes/No)';
        }

        field(50115; DateSold; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date Sold/Lost';
        }

        field(50116; PriorityCode; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Priority Code';
        }

        field(50117; LostAccountStatus; Enum LostAccoutnsStatus)
        {
            DataClassification = ToBeClassified;
            Caption = 'Account Status';
        }


        field(50118; OverrideRep; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Override Rep';
            TableRelation = "Salesperson/Purchaser";
        }


        field(50119; BackUpRep; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Back Up Rep';
            TableRelation = "Salesperson/Purchaser";
        }

        field(50121; AccountReview; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Account Review (Yes/No)';
        }


        field(50122; "Service Rep Visits per Year"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Rep Visits per Year';
        }

        field(50123; "Service Rep Hours per Visit"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Rep Hours per Visit';
        }


        field(50124; IN_ServiceRep; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
            Caption = 'Service Rep';
        }


    }

    var
        myInt: Integer;


}