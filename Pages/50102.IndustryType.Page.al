page 50102 "IndustryType"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = IndustryType;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(SalesPerson_IndustryType; Rec.SalesPerson_IndustryType)
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