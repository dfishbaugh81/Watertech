pageextension 50157 "ItemListEx" extends "Item List"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field("Description 2"; rec."Description 2")
            {
                ApplicationArea = All;
                Visible = true;

            }
        }

        addafter("Vendor No.")
        {
            field(IN_ShippingIdNo; rec.IN_ShippingIdNo)
            {
                ApplicationArea = All;

            }

            field(IN_HazMat; rec.IN_HazMat)
            {
                ApplicationArea = All;

            }

            field(IN_ProperShippingName; rec.IN_ProperShippingName)
            {
                ApplicationArea = All;

            }

            field(IN_HazardClass; rec.IN_HazardClass)
            {
                ApplicationArea = All;

            }

            field(IN_PackingGroup; rec.IN_PackingGroup)
            {
                ApplicationArea = All;

            }

            field(IN_LabelRequired; rec.IN_LabelRequired)
            {
                ApplicationArea = All;

            }

            field(IN_NMFC_No; rec.IN_NMFC_No)
            {
                ApplicationArea = All;

            }

            field(IN_NMFC_Class; rec.IN_NMFC_Class)
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