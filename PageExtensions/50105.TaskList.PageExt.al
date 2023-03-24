pageextension 50105 "OpportunityTasksListPage50122" extends "Task List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Contact No.")
        {

            field(EndingDate; rec."Ending Date")
            {
                ApplicationArea = All;

            }

            field(ContactName; rec."Contact Name")
            {
                ApplicationArea = All;

            }
            field(ContactCompanyName; rec."Contact Company Name")
            {
                ApplicationArea = All;

            }


        }

    }

    actions
    {
        // Add changes to page actions here
    }

    procedure SetPageToShowMyPendingUserTasks()

    var
        UID: Text;
        SalesUser: text;
        userSetup: Record "User Setup";


    begin


        UID := UserId;

        userSetup.get(UID);

        SalesUser := userSetup."Salespers./Purch. Code";

        // This functions sets up this page to show pending tasks assigned to current user
        ShowMyPendingTasks := true;

        rec.Reset;
        rec.SetCurrentKey(rec.Status, rec."Salesperson Code", rec."System To-do Type");

        rec.SetFilter(rec.Status, 'Not Started|In Progress|Waiting');

        rec.SetRange(rec."Salesperson Code", SalesUser);

        rec.SetRange(rec."System To-do Type", rec."System To-do Type"::Organizer);


    end;

    var
        ShowMyPendingTasks: Boolean;

}