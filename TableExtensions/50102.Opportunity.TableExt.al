tableextension 50102 "OpportunityExTable50104" extends Opportunity
{
    fields
    {
        // Add changes to table fields here
        field(50107; "GP%"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Estimated GP%';
            Editable = true;

            trigger OnValidate()
            var
                EGP: Record Opportunity;
                EV: Record "Opportunity Entry";
                GP: Record Opportunity;
            begin

                rec."Estimated Gross Profit" := (rec."GP%" / 100) * EstimatedGrossProfit;

            end;
        }


        field(50108; "Estimated Gross Profit"; Decimal)
        {
            Caption = 'Estimated GP Amount';
            // Editable = false;

            trigger OnValidate()
            var
                myInt: Integer;
            begin

                rec."GP%" := (rec."Estimated Gross Profit" / EstimatedGrossProfit) * 100;
            end;

        }

        field(50109; EstimatedGrossProfit; Decimal)
        {

            Caption = 'Estimated Value (LCY)';
            FieldClass = FlowField;
            CalcFormula = Sum("Opportunity Entry"."Estimated Value (LCY)" WHERE("Opportunity No." = FIELD("No."),
                                                                                 Active = CONST(true)));
            Editable = false;

        }

        field(50110; LeadScore; text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Lead Score';
        }


        field(50111; ClosedValue; decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Closed Value';

            trigger OnValidate()
            var
            begin
                rec."GP of Closed Value" := (rec."ClosedGP%" / 100) * rec.ClosedValue;
            end;
        }

        field(50112; "ClosedGP%"; Decimal)
        {
            DataClassification = ToBeClassified;

            Caption = 'Actual GP at Closing';
            trigger OnValidate()
            var
            begin
                rec."GP of Closed Value" := (rec."ClosedGP%" / 100) * rec.ClosedValue;
            end;
        }

        field(50113; "GP of Closed Value"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'GP of Closed Value';
        }

        field(50121; Opportunity_industryType; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Industry Type';
            TableRelation = IndustryType;

        }

        field(50100; Opportunity_SecSalesPerson; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
            Caption = 'Secondary Salesperson Code';
        }

        field(50122; OpportunityEstClosingDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Opportunity Estimated Closing Date';

        }

        modify("Contact No.")
        {
            trigger OnAfterValidate()
            var
                CompetitorContact: Record Contact_Competitors;
                OpportunityCompetitor: Record CompetitorOpportunity;
                OpportunityRecord: Record Opportunity;

                ContactNo: Text;
            begin

                //This code checks if Contact is changed on the opportunity card and clears the CompetitorOpportunity card from previous Competitor records.
                OpportunityCompetitor.SetFilter(OpportunityCompetitor."Opportunity No.", '=%1', rec."No.");

                if OpportunityCompetitor.FindSet then begin


                    OpportunityCompetitor.DeleteAll(true);

                end;

            end;

        }

        field(50123; OpportunityLastDateModified; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Last Date Modified';
            Editable = false;
        }

    }

}