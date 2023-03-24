tableextension 50117 "SalesInvoiceLineEx" extends "Sales Invoice Line"
{
    fields
    {
        // Add changes to table fields here
        field(50117; "Include Freight"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Include Freight';
            Editable = false;
        }


        field(50118; IN_ShippingAgentCode; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Shipping Agent Code';


        }

        field(50119; IN_ShippingAgentName; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Shipping Agent Name';

        }





    }

    keys
    {

        key(ExtKey; IN_ShippingAgentName)
        {

        }

    }

    trigger OnAfterInsert()
    var
        shippingAgent: Record "Shipping Agent";
    begin
        /*
        repeat
            if rec.IN_ShippingAgentCode <> '' then begin

                Message('REcord is %1', rec."No.");
            end;

        until rec.Next = 0;
        */


    end;

}





