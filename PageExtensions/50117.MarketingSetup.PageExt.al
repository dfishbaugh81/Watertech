pageextension 50117 "MarketingSetupPageEx" extends "Marketing Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter(General)
        {
            field(SalesCodeSetup; rec.SalesCodeSetup)
            {
                ApplicationArea = All;

            }
        }

        addafter("Inherit Communication Details")
        {
            field(PostingGroupSetup; rec.CRMCustomerPostingGroup)
            {
                ApplicationArea = All;
                ToolTip = 'Sets Customer Posting Group on Customer Card';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

}