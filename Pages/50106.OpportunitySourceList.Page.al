page 50106 "OpportunitySourceList"
{
    Caption = 'Opportunity Source/Opportunity';
    PageType = List;
    UsageCategory = Administration;
    ApplicationArea = All;
    SourceTable = OpportunitySource_Opportunity;
    //Editable = true;

    PopulateAllFields = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Opportunity No."; rec."Opportunity No.")
                {
                    ApplicationArea = All;


                }

                field(Competitor_Name; rec.OpportunitySource)
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


    //Automatically sets Opportunity record No on Opportunity Source/Opportunity page
    trigger OnOpenPage()
    var
        assignrecord: Record OpportunitySource_Opportunity;
        myFieldRef: FieldRef;
        OpportunityRecref: RecordRef;
        OpportunityRecord: Record Opportunity;
    begin

        OpportunityRecref.Open(50105);
        myFieldRef := OpportunityRecref.Field(7);
        assignrecord.Init();
        MyFieldRef.Value := OpportunityRecord."No.";
        if rec.OpportunitySource = '' then begin
            //rec.Reset;
            //rec.Init;
            //OpportunityRecref.Modify;
        end;


    end;

}
