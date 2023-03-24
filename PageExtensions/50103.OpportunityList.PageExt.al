pageextension 50103 "OpportunityListEx" extends "Opportunity List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Contact No.")
        {
            field(ContactName; rec."Contact Name")
            {
                ApplicationArea = All;
                Visible = true;
            }

            field(ContactCompanyName; rec."Contact Company Name")
            {
                ApplicationArea = All;
                Visible = true;
            }

            field("GP of Closed Value"; rec."GP of Closed Value")
            {
                ApplicationArea = All;
                Visible = true;
            }

            field(OpportunityEstClosingDate; rec.OpportunityEstClosingDate)
            {
                ApplicationArea = All;
                Visible = true;

            }


            field(OpportunityLastDatemodifified; rec.OpportunityLastDateModified)
            {
                ApplicationArea = All;

            }

        }
    }

    actions
    {
        // Add changes to page actions here
    }


    //CODE AUTOMATICALLY SETS A FILTER TO SHOW RECORDS BASED ON SALESPERSON CODE
    //The following trigger is enabled whith a boolean field in the Marketing setup   

    /*   trigger OnOpenPage()
       var

           UID: Text;
           SalesUser: text;
           userSetup: Record "User Setup";

           MarketingSetup: Record "Marketing Setup";

       begin

           IF userSetup.get(UserId) THEN begin
               SalesUser := userSetup."Salespers./Purch. Code";

               MarketingSetup.get();

               if MarketingSetup.SalesCodeSetup then begin
                   rec.SetFilter(rec."Salesperson Code", '=%1', SalesUser);
               end;

           end;

       end;
       */

    //CODE AUTOMATICALLY SETS A FILTER TO SHOW RECORDS BASED ON SALESPERSON CODE

    //The following trigger is enabled whith a boolean field in the UserSetup table  

    trigger OnOpenPage()
    var

        UID: Text;
        SalesUser: text;
        userSetup: Record "User Setup";

        MarketingSetup: Record "Marketing Setup";


    begin

        IF userSetup.get(UserId) THEN begin
            SalesUser := userSetup."Salespers./Purch. Code";

            if userSetup.ContactOpportunityFilter then begin
                rec.SetFilter(rec."Salesperson Code", '=%1', SalesUser);
            end;

        end;
    end;


}