page 50104 "CompetitorOpportunityList"
{
    Caption = 'Competitor/Opportunity';
    PageType = List;
    UsageCategory = Administration;
    ApplicationArea = All;
    SourceTable = CompetitorOpportunity;

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
        assignrecord: Record CompetitorOpportunity;
        myFieldRef: FieldRef;
        OpportunityRecref: RecordRef;
        OpportunityRecord: Record Opportunity;

        //Review
        CompetitorContact: Record Contact_Competitors;
        OpportunityCompetitor: Record CompetitorOpportunity;

        OpportunityNo: Text;

    begin

        OpportunityRecref.Open(50105);
        myFieldRef := OpportunityRecref.Field(7);
        assignrecord.Init();
        MyFieldRef.Value := OpportunityRecord."No.";





        if rec.IsEmpty then begin

            OpportunityRecord.SetFilter("No.", '=%1', rec."Opportunity No.");

            OpportunityNo := Rec."Opportunity No.";

            if OpportunityRecord.FindSet then begin

                repeat

                    CompetitorContact.SetFilter("Contact No.", '=%1', OpportunityRecord."Contact No.");

                    if CompetitorContact.FindSet then begin

                        repeat

                            OpportunityCompetitor.Competitor_Name := CompetitorContact.Competitor_Name;
                            OpportunityCompetitor."Opportunity No." := OpportunityNo;
                            OpportunityCompetitor.Insert;

                        until
                        CompetitorContact.Next = 0;
                    end;

                until

                  OpportunityCompetitor.Next = 0;
            end;

        end;

    end;

}