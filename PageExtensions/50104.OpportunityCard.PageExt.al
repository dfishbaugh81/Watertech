pageextension 50104 "OpportunityEx" extends "Opportunity Card"
{


    layout
    {
        // Add changes to page layout here
        addafter("Segment No.")
        {
            field("GP%"; rec."GP%")
            {
                ApplicationArea = All;

            }

            field("Estimated Gross Porfit"; rec."Estimated Gross Profit")
            {
                ApplicationArea = All;

                Editable = fieldEditable;

            }


            field(EstiatedGrossProfit; rec.EstimatedGrossProfit)
            {
                ApplicationArea = All;
                Visible = false;

            }

            field(LeadScore; rec.LeadScore)
            {
                ApplicationArea = All;
            }

            field(ClosedValue; rec.ClosedValue)
            {
                ApplicationArea = All;
                Editable = fieldEditable;
            }

            field("ClosedGP%"; rec."ClosedGP%")
            {
                ApplicationArea = All;
                Editable = fieldEditable;
            }

            field(OpportunityEstClosingDate; rec.OpportunityEstClosingDate)
            {
                ApplicationArea = All;
            }


        }

        addlast(content)
        {
            group(Finance)
            {
                Caption = 'Finance';
                field("GP of Closed Value"; rec."GP of Closed Value")
                {
                    ApplicationArea = All;
                    Editable = fieldEditable;
                }
            }
        }

        addafter("Salesperson Code")
        {

            field(Opportunity_industryType; rec.Opportunity_industryType)
            {
                ApplicationArea = All;
                Visible = false;

            }

        }

        addafter("Salesperson Code")
        {
            field(Opportunity_SecSalesPerson; Rec.Opportunity_SecSalesPerson)
            {
                ApplicationArea = All;
            }
        }


        modify(Description)
        {
            ApplicationArea = All;
            ShowMandatory = true;
        }

        modify("Contact No.")
        {
            ApplicationArea = All;
            ShowMandatory = true;


            trigger OnAfterValidate()
            var

            begin

            end;


        }

        modify("Salesperson Code")
        {
            ApplicationArea = all;
            ShowMandatory = true;
        }


        addfirst(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(5092), "No." = FIELD("No.");
            }

        }

        modify("Sales Cycle Code")
        {
            ApplicationArea = All;
            ShowMandatory = true;
        }

        addafter("Segment No.")
        {
            field(OpportunityLastDateModified; rec.OpportunityLastDateModified)
            {
                ApplicationArea = All;

            }
        }





    }

    actions
    {
        // Add changes to page actions here
        addlast(processing)
        {
            action("Show Competitors")
            {
                ApplicationArea = All;
                RunObject = page CompetitorOpportunityList;

                RunPageLink = "Opportunity No." = field("No.");

            }

            action("Opportunity Source")
            {
                ApplicationArea = all;
                RunObject = page OpportunitySourceList;

                RunPageLink = "Opportunity No." = field("No.");


            }


        }
    }

    var
        [InDataSet]
        fieldEditable: Boolean;

        [InDataSet]
        fieldVisible: Boolean;

    trigger OnAfterGetCurrRecord()
    var
        opportunityEntry: Record "Opportunity Entry";
        opportunityCard: Record Opportunity;
    begin

        if not rec.Closed then begin
            fieldEditable := false;

        end

        else begin

            fieldEditable := true;

        end;

    end;


    trigger OnOpenPage()
    begin
        if not rec.Closed then begin
            fieldVisible := false;

        end

        else begin

            fieldVisible := true;

        end;

    end;
}