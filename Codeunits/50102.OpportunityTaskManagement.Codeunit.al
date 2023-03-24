codeunit 50102 "OpportunityTaskManagement"
{
    //The following Procedure makes a funtion call SetTasksFilter to calculate how many Pending Tasks are open
    procedure GetMyPendingUserTasksCount(): Integer

    var

    begin
        // Gets total count of opportunity tasks

        exit(SetTasksFilter);


    end;

    //The following Procedure was previously used to set filter on Opportunity Tasks Queue

    /*
    local procedure CalculateOpportunityTasksCount(): Integer
    var
        OpportunityTask: Record "To-do";

        OpportunityTaskListPage: Page "Task List";

        UID: Text;
        SalesUser: text;
        userSetup: Record "User Setup";

    begin

        UID := UserId;

        userSetup.get(UID);

        SalesUser := userSetup."Salespers./Purch. Code";

        OpportunityTask.Reset();

        OpportunityTask.SetCurrentKey(OpportunityTask.Status, OpportunityTask."Salesperson Code", OpportunityTask."System To-do Type");

        OpportunityTask.SetFilter(OpportunityTask.Status, 'Not Started|In Progress|Waiting');

        OpportunityTask.SetRange(OpportunityTask."Salesperson Code", SalesUser);

        OpportunityTask.SetRange(OpportunityTask."System To-do Type", OpportunityTask."System To-do Type"::Organizer);

        exit(OpportunityTask.Count);



    end;
    */



    //The following Procedure is used to run the Opporuntiy Tasks Page based on the filter for Sales User/Status/System Task Type.

    procedure TaskFilterRun()
    var
        OpportunityTask: Record "To-do";
        UID: Text;
        SalesUser: text;
        userSetup: Record "User Setup";
    begin


        UID := UserId;

        IF userSetup.get(UID) THEN begin


            SalesUser := userSetup."Salespers./Purch. Code";

            OpportunityTask.Reset();

            if userSetup.ContactOpportunityFilter then begin

                OpportunityTask.SetCurrentKey(OpportunityTask.Status, OpportunityTask."Salesperson Code", OpportunityTask."System To-do Type");

                OpportunityTask.SetFilter(OpportunityTask.Status, 'Not Started|In Progress|Waiting');

                OpportunityTask.SetRange(OpportunityTask."Salesperson Code", SalesUser);

                OpportunityTask.SetRange(OpportunityTask."System To-do Type", OpportunityTask."System To-do Type"::Organizer);

            end

            else begin
                OpportunityTask.Reset();

                OpportunityTask.SetCurrentKey(OpportunityTask.Status, OpportunityTask."Salesperson Code", OpportunityTask."System To-do Type");

                OpportunityTask.SetFilter(OpportunityTask.Status, 'Not Started|In Progress|Waiting');

                OpportunityTask.SetRange(OpportunityTask."Salesperson Code");

                OpportunityTask.SetRange(OpportunityTask."System To-do Type", OpportunityTask."System To-do Type"::"Contact Attendee");

            end;

            //Runs the Page based on filters previously defined.

            Page.Run(5096, OpportunityTask);

        end;

    end;

    //The following Procedure is used to Count the Opporuntiy Tasks that are open based on the filter for Sales User/Status/System Task Type.

    local procedure SetTasksFilter(): Integer
    var
        OpportunityTask: Record "To-do";
        UID: Text;
        SalesUser: text;
        userSetup: Record "User Setup";
    begin

        UID := UserId;

        IF userSetup.get(UID) THEN begin

            SalesUser := userSetup."Salespers./Purch. Code";

            OpportunityTask.Reset();

            if userSetup.ContactOpportunityFilter then begin

                OpportunityTask.SetCurrentKey(OpportunityTask.Status, OpportunityTask."Salesperson Code", OpportunityTask."System To-do Type");

                OpportunityTask.SetFilter(OpportunityTask.Status, 'Not Started|In Progress|Waiting');

                OpportunityTask.SetRange(OpportunityTask."Salesperson Code", SalesUser);

                OpportunityTask.SetRange(OpportunityTask."System To-do Type", OpportunityTask."System To-do Type"::"Contact Attendee");


            end

            else begin
                OpportunityTask.Reset();

                OpportunityTask.SetCurrentKey(OpportunityTask.Status, OpportunityTask."Salesperson Code", OpportunityTask."System To-do Type");

                OpportunityTask.SetFilter(OpportunityTask.Status, 'Not Started|In Progress|Waiting');

                OpportunityTask.SetRange(OpportunityTask."Salesperson Code");

                OpportunityTask.SetRange(OpportunityTask."System To-do Type", OpportunityTask."System To-do Type"::"Contact Attendee");


            end;

        end;

        //Outputs the amount of Tasks opened based on previously defined filter.

        exit(OpportunityTask.Count);

    end;

}