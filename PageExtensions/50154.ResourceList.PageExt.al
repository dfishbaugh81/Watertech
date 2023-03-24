pageextension 50154 "ResourceListEx" extends "Resource List"
{
    layout
    {
        // Add changes to page layout here
        addafter(Type)
        {
            field(ResourceCatCode; rec.ResourceCatCode)
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


    trigger OnOpenPage()

    var
        userSetup: Record "User Setup";

        resourceList: Record Resource;
        resoursePage: Page "Resource List";

        salesLine: Record "Sales Line";

        UID: Text;
    begin

        UID := UserId;


        if userSetup.Get(UID) then begin


            if userSetup.ResourceFilter then begin

                resourceList.SetFilter("Resource Group No.", 'OPPORTUNITY CODES');

                CurrPage.SetTableView(resourceList);


            end;

        end;

    end;
}