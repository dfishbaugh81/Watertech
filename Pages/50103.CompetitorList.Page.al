page 50103 "CompetitorList"
{
    Caption = 'Competitor List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Competitor;

    layout
    {
        area(Content)
        {
            repeater("Competitor List")
            {
                field(CompetitorName; rec.CompetitorName)
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