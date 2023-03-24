pageextension 50111 "SalesQuoteListPage" extends "Sales Quotes"
{
    layout
    {
        addafter("Due Date")
        {
            field(IMP_JobType; rec.IMP_JobType)
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

    /*  trigger OnOpenPage()
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