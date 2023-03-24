codeunit 50111 "SetTodaysDateCU"
{

    Permissions = TableData "Sales Invoice Header" = rimd;

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;



    procedure SetTodaysDate(var currentRec: Record "Sales Header")

     SalesInvRec: Record "Sales Invoice Header";

    begin

        SalesInvRec.SetFilter(SalesInvRec."Order No.", '=%1', currentRec."No.");


        if SalesInvRec.FindSet then begin

            SalesInvRec.Validate(SalesInvRec."Document Date", Today);
            SalesInvRec.Validate(SalesInvRec."Order Date", Today);
            SalesInvRec.Validate(SalesInvRec."Posting Date", Today);

            SalesInvRec.Modify;

        end;



    end;
}