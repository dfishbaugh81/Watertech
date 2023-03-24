pageextension 50118 "MyExtension" extends "Business Manager Role Center"
{
    layout
    {
        // Added a Cue for Opportunity Tasks
        addafter("User Tasks Activities")
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