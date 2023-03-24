tableextension 50127 "SalesPriceEx" extends "Sales Price"
{
    fields
    {
        // Add changes to table fields here
        field(50127; NewBusinessDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'New Business Date';
        }

        field(50128; AnnualUsage; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Annual Usage';
        }
    }

    var
        myInt: Integer;
}