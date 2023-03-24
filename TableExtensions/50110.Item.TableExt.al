tableextension 50110 "ItemsTableEx" extends Item
{
    fields
    {
        // Add changes to table fields here


        field(50110; TargetGP; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Target GP';
            DecimalPlaces = 2;
        }

        field(50111; InboundFreight; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Inbound Freight ($)';
            DecimalPlaces = 2;
        }

        field(50112; OutboundFreight; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Outbound Freight ($)';
            DecimalPlaces = 2;
        }

        field(50113; FDAcheckbox; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'FDA Checkbox';
        }

        field(50114; WatertechStandardCost; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Watertech Standard Cost ($)';
            DecimalPlaces = 4;
        }

        field(50115; Density; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Density';
            DecimalPlaces = 2;
        }

        field(50116; SpecificGravity; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Specific Gravity';
            DecimalPlaces = 2;
        }

        field(50117; IN_PriceList; Enum ItemPriceList)
        {
            DataClassification = ToBeClassified;
            Caption = 'Price List';
            InitValue = 'No';
        }

        modify("Common Item No.")
        {
            Caption = 'Product ID.';
        }

        field(50118; IN_LastWatertechStdCost; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Last Watertech Standard Cost';
            DecimalPlaces = 4;
        }

        field(50119; IN_ShippingIdNo; text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Shipping Id No.';
        }

        field(50120; IN_HazMat; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'HazMat';
        }

        field(50121; IN_ProperShippingName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Proper Shipping Name';
        }

        field(50122; IN_HazardClass; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Hazard Class';
        }
        field(50123; IN_PackingGroup; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Packing Group';
        }

        field(50124; IN_LabelRequired; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Label Required';
        }

        field(50125; IN_NMFC_No; Text[25])
        {
            DataClassification = ToBeClassified;
            Caption = 'NMFC No.';
        }

        field(50126; IN_NMFC_Class; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'NMFC Class';
        }

        field(50127; IN_ServiceRep; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
            Caption = 'Service Rep';
        }

    }


}