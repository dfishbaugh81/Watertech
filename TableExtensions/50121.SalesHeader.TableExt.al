tableextension 50121 "SalesHeaderDocEx" extends "Sales Header"
{
    fields
    {
        field(50119; IMP_WorkDescrition; Text[200])
        {
            DataClassification = ToBeClassified;
            Caption = 'Work Description (Txt)';
        }
        // Add changes to table fields here
        field(50121; IMP_JobType; Enum Sales_JobTypes)
        {
            DataClassification = ToBeClassified;
            Caption = 'Job Type';
        }
    }

    var
        myInt: Integer;


    trigger OnModify()
    var
    begin

        GetWorkDescription(Rec);

    end;



    procedure GetWorkDescription(SalesHeader: Record "Sales Header") WorkDescription: Text
    var
        MyInStream: InStream;

    begin
        Clear(WorkDescription);
        salesHeader.Calcfields("Work Description");
        If SalesHeader."Work Description".HasValue() then begin
            SalesHeader."Work Description".CreateInStream(MyInStream);
            MyInStream.Read(WorkDescription);

            IMP_WorkDescrition := WorkDescription;


        end;
    end;


}