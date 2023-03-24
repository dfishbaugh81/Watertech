tableextension 50105 "OpportunityEntryEx" extends "Opportunity Entry"
{
    fields
    {
        // Add changes to table fields here

        field(50100; OpportunityModifiedDate; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Last Date Modified';

        }
    }

    var
        myInt: Integer;




    trigger OnModify()
    var
        opportunityCardDateMod: Record Opportunity;

    begin



        rec.OpportunityModifiedDate := CurrentDateTime;

        opportunityCardDateMod.SetFilter("No.", '=%1', rec."Opportunity No.");

        if opportunityCardDateMod.FindSet then begin


            opportunityCardDateMod.OpportunityLastDateModified := CurrentDateTime;


        end;



    end;




    trigger OnInsert()
    var
        opportunityCardDateMod: Record Opportunity;

    begin



        rec.OpportunityModifiedDate := CurrentDateTime;

        opportunityCardDateMod.SetFilter("No.", '=%1', rec."Opportunity No.");

        if opportunityCardDateMod.FindSet then begin


            opportunityCardDateMod.OpportunityLastDateModified := CurrentDateTime;

            opportunityCardDateMod.Modify(true);

        end;



    end;





}