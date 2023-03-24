pageextension 50115 "UserSetupExPage" extends "User Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter(PhoneNo)
        {
            field(ContactOpportunityFilter; rec.ContactOpportunityFilter)
            {
                ApplicationArea = All;
                ToolTip = 'Sets a filter on the Contacts/Opportunities list based on User ID';
            }
            field(ResourceFilter; rec.ResourceFilter)
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