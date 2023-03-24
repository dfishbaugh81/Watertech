page 50105 "OpportunitySourcePage"
{
    Caption = 'Opportunity Source';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = OpportunitySourceTable;


    layout
    {
        area(Content)
        {
            repeater("Opportunit-Source")
            {
                field(OpportunitySource; rec.OpportunitySource)
                {
                    ApplicationArea = All;

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
        myInt: Integer;
}