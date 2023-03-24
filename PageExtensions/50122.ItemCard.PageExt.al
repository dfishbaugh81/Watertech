pageextension 50122 "ItemCardEx" extends "Item Card"
{
    layout
    {
        // Add changes to page layout here

        addafter("Purchasing Code")
        {


            field(TargetGP; rec.TargetGP)
            {
                ApplicationArea = All;

            }

            field(InboundFreight; rec.InboundFreight)
            {
                ApplicationArea = All;

            }

            field(OutboundFreight; rec.OutboundFreight)
            {
                ApplicationArea = All;

            }

            field(FDAcheckbox; rec.FDAcheckbox)
            {
                ApplicationArea = All;

            }

            field(Density; rec.Density)
            {
                ApplicationArea = All;

            }

            field(SpecificGravity; rec.SpecificGravity)
            {
                ApplicationArea = All;

            }

            field(IN_PriceList; rec.IN_PriceList)
            {
                ApplicationArea = All;

            }

        }

        addafter("Unit Cost")
        {
            field(WatertechStandardCost; rec.WatertechStandardCost)
            {
                ApplicationArea = All;

            }

            field(IN_LastWatertechStdCost; rec.IN_LastWatertechStdCost)
            {
                ApplicationArea = All;

            }
        }

        addafter(Description)
        {
            field("Description 2"; rec."Description 2")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }

        addafter(Warehouse)
        {
            group("Bill of Lading")
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


    }

    actions
    {
        // Add changes to page actions here
    }


}