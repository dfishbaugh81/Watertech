page 50100 "ContactTypeList"
{
    Caption = 'Contact Type';
    PageType = List;
    UsageCategory = Administration;
    ApplicationArea = All;
    SourceTable = ContactType;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Type; rec.Type)
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