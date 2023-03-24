pageextension 50101 "ContactsListExPage50113" extends "Contact List"
{
    layout
    {
        //modiefies city and state field to be added as columns on the contact list

        addafter("Salesperson Code")
        {
            field(City; rec.City)
            {
                Visible = true;
                ApplicationArea = All;
            }

            field(state; rec.County)
            {
                Visible = true;
                ApplicationArea = All;
            }


            field(Industry; rec.Contact_industryType)
            {
                ApplicationArea = All;

            }

            field("Company Type"; rec.ContactCompanyType)
            {
                ApplicationArea = All;

            }

            field("Organizational Level Code"; rec."Organizational Level Code")
            {
                ApplicationArea = All;
                Caption = 'Role';

            }

            field(ContactLeadScore; rec.ContactsLeadScore)
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

    //The following trigger is enabled whith a boolean field in the MarketingSetup table  


    /* trigger OnOpenPage()
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