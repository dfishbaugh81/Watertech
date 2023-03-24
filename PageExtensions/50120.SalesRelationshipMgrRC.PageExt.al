pageextension 50120 "Sales&RelationShip Role" extends "Sales & Relationship Mgr. RC"
{
    layout
    {
        // Added a Cue for Opportunity Tasks
        addafter(Control56)
        {
            part(OpportunityTasks; OpportunityTaskCue)
            {
                ApplicationArea = Suite;
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