tableextension 50103 "SalesPersonEx" extends "Salesperson/Purchaser"
{
    fields
    {
        // Add changes to table fields here

        field(50114; NewGrossProfit; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Current Year Sales Goal';
        }

        field(50115; NewSalesGP; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Current Year GP Goal';
        }

        field(50116; HistoricalGrossProfit; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Previous Year Sales Goal';
        }

        field(50111; PTOHours; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'PTO Hours';

        }

        field(50117; HistoricalSalesGP; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Previous Year GP Goal';
        }

        field(50122; SalesPerson_industryType; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Industry Type';
            TableRelation = IndustryType;

        }


        //REVIEW THIS CODE!!!!!!!!!!!!!!!!!!

        field(50123; SalesPerson_UserId; code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'UserID';
            TableRelation = User;

        }




        field(50124; SalesPersonCode_UserId; text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'User Id';
            TableRelation = "User Setup";

        }



    }

    var
        myInt: Integer;
}