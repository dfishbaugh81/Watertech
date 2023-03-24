pageextension 50156 "SalesPricesEx" extends "Sales Prices"
{
    layout
    {
        // Add changes to page layout here
        addafter("Ending Date")
        {
            field(NewBusinessDate; rec.NewBusinessDate)
            {
                ApplicationArea = All;

            }

            field(AnnualUsage; rec.AnnualUsage)
            {
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}