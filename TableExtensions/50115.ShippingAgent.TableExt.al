tableextension 50115 "ShippingAgentEx" extends "Shipping Agent"
{
    fields
    {
        // Add changes to table fields here
        field(50115; IN_CostPerPound; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Freight Per Pound';
            DecimalPlaces = 2;
        }
    }

    var
        myInt: Integer;
}