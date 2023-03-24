page 50101 "ContactIndustryList"
{
    Caption = 'Contact Industry';
    PageType = List;
    UsageCategory = Administration;
    ApplicationArea = All;
    SourceTable = ContactIndustry;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Industry; rec.Industry)
                {
                    ApplicationArea = All;
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}