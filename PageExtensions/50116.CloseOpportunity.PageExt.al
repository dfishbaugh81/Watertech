pageextension 50116 "CloseOpportunityEx" extends "Close Opportunity"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }


    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        MarketingSetup: Record "Marketing Setup";
        CustomerPostingGroup: Record Customer;
    begin
        if CloseAction in [ACTION::OK, ACTION::LookupOK] then begin
            MarketingSetup.Get();
            CustomerPostingGroup.FindLast;
            if CustomerPostingGroup."Customer Posting Group" = '' then begin
                if MarketingSetup.CRMCustomerPostingGroup then begin
                    CustomerPostingGroup."Customer Posting Group" := 'CRMCUSTOMER';
                    CustomerPostingGroup.Modify;
                end

            end;

        end;



    end;



    var
        myInt: Integer;
}