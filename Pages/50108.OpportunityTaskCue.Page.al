page 50108 "OpportunityTaskCue"
{
    Caption = 'Opportunity Tasks';
    PageType = CardPart;
    RefreshOnActivate = true;
    ShowFilter = false;
    SourceTable = "To-do";


    layout
    {
        area(Content)
        {
            cuegroup("Opportunity Tasks")
            {
                Caption = 'Opportunity Tasks';

                //The following field, makes a funtion call GetPendingUserTaskCount to calculate how many Pending Tasks are open

                field(OpportunityStatus; OpportunityTasks.GetMyPendingUserTasksCount())
                {
                    ApplicationArea = All;
                    Caption = 'Pending Opportunity Tasks';
                    Image = Checklist;
                    DrillDownPageId = 5096;

                    trigger OnDrillDown()
                    var

                        OpportunityTasksList: Page "Task List";

                    begin
                        //This funtion sets the filter on the Opportunity Tasks Queue once Tile is open.
                        OpportunityTasks.TaskFilterRun();


                    end;


                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        OpportunityTasks: Codeunit OpportunityTaskManagement;
}