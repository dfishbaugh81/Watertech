page 50107 "CompetitorContactsList"
{
    Caption = 'Competitor/Contacts';
    PageType = List;
    UsageCategory = Administration;
    ApplicationArea = All;
    SourceTable = Contact_Competitors;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Opportunity No."; rec."Contact No.")
                {
                    ApplicationArea = All;
                }

                field(Competitor_Name; rec.Competitor_Name)
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

    trigger OnOpenPage()
    var
        assignrecord: Record Contact_Competitors;
        myFieldRef: FieldRef;
        OpportunityRecref: RecordRef;
        OpportunityRecord: Record Opportunity;
    begin

        OpportunityRecref.Open(50105);
        myFieldRef := OpportunityRecref.Field(7);
        assignrecord.Init();
        MyFieldRef.Value := OpportunityRecord."No.";
        //if rec.OpportunitySource = '' then begin
        //rec.Reset;
        //rec.Init;
        //OpportunityRecref.Modify;
        // end;


    end;






}