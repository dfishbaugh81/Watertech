tableextension 50140 "SalesInvoiceHeaderEx" extends "Sales Invoice Header"
{
    fields
    {
        field(50121; IMP_JobType; Enum Sales_JobTypes)
        {
            DataClassification = ToBeClassified;
            Caption = 'Job Type';
        }
    }

    var
        myInt: Integer;


    procedure EmailContractRecords(ShowDialog: Boolean)
    var
        DocumentSendingProfile: Record "Document Sending Profile";
        DummyReportSelections: Record "Report Selections";
        ReportDistributionMgt: Codeunit "Report Distribution Management";
        DocumentTypeTxt: Text[50];
        IsHandled: Boolean;
    begin
        DocumentTypeTxt := ReportDistributionMgt.GetFullDocumentTypeText(Rec);

        IsHandled := false;

        rec.SetFilter("No.", '=%1', rec."No.");

        if rec.FindSet then begin


            if not IsHandled then
                DocumentSendingProfile.TrySendToEMail(
                  DummyReportSelections.Usage::"S.Test".AsInteger(), Rec, rec.FieldNo("No."), DocumentTypeTxt,
                  rec.FieldNo("Bill-to Customer No."), ShowDialog);

        end;




    end;







}