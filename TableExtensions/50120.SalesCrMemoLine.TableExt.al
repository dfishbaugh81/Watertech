tableextension 50120 "SalesCrMemoLine" extends "Sales Cr.Memo Line"
{
    fields
    {
        // Add changes to table fields here
        field(50118; "Include Freight"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Include Freight';
        }

        field(50119; INSalesCreditShippingAgentCode; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Shipping Agent Code';
        }


        field(50120; ShippingAgentName; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Shipping Agent Name';

        }



    }

    var
        myInt: Integer;
}