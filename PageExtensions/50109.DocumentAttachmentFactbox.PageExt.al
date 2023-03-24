pageextension 50109 "AttachmentEx" extends "Document Attachment Factbox"
{
    layout
    {
        // Add changes to page layout here


        modify(Documents)

        {
            trigger OnDrillDown()
            var
                Opportunities: Record Opportunity;
                contacts: Record Contact;
                recRef: RecordRef;
                DocumentAttachmentDetails: Page "Document Attachment Details";


                Customer: Record Customer;
                Vendor: Record Vendor;
                Item: Record Item;
                Employee: Record Employee;
                FixedAsset: Record "Fixed Asset";
                Resource: Record Resource;
                SalesHeader: Record "Sales Header";
                PurchaseHeader: Record "Purchase Header";
                Job: Record Job;
                SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                SalesInvoiceHeader: Record "Sales Invoice Header";
                PurchInvHeader: Record "Purch. Inv. Header";
                PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";


            begin




                case rec."Table ID" of

                    0:
                        exit;
                    Database::Opportunity:
                        begin
                            recRef.Open(Database::Opportunity);
                            if Opportunities.Get(rec."No.") then
                                recRef.GetTable(Opportunities);
                        end;

                    Database::Contact:
                        begin
                            recRef.Open(Database::Contact);
                            if contacts.Get(rec."No.") then
                                recRef.GetTable(contacts);

                        end;



                    Database::Customer:
                        begin
                            recRef.Open(Database::Customer);
                            if Customer.Get(rec."No.") then
                                recRef.GetTable(Customer);


                        end;

                    Database::Vendor:
                        begin
                            recRef.Open(Database::Vendor);
                            if Vendor.Get(rec."No.") then
                                recRef.GetTable(Vendor);


                        end;

                    Database::Item:
                        begin
                            recRef.Open(Database::Item);
                            if Item.Get(rec."No.") then
                                recRef.GetTable(Item);


                        end;

                    Database::Employee:
                        begin
                            recRef.Open(Database::Employee);
                            if Employee.Get(rec."No.") then
                                recRef.GetTable(Employee);


                        end;

                    Database::"Fixed Asset":
                        begin
                            recRef.Open(Database::"Fixed Asset");
                            if FixedAsset.Get(rec."No.") then
                                recRef.GetTable(FixedAsset);


                        end;


                    Database::Resource:
                        begin
                            recRef.Open(Database::Resource);
                            if Resource.Get(rec."No.") then
                                recRef.GetTable(Resource);


                        end;

                    Database::"Sales Header":
                        begin
                            recRef.Open(Database::"Sales Header");
                            if SalesHeader.Get(rec."Document Type", rec."No.") then
                                recRef.GetTable(SalesHeader);

                        end;



                    Database::"Purchase Header":
                        begin
                            recRef.Open(Database::"Purchase Header");
                            if PurchaseHeader.Get(rec."Document Type", rec."No.") then
                                recRef.GetTable(PurchaseHeader);
                        end;

                    Database::Job:
                        begin
                            recRef.Open(Database::Job);
                            if Job.Get(rec."No.") then
                                recRef.GetTable(Job);
                        end;

                    Database::"Sales Cr.Memo Header":
                        begin
                            recRef.Open(Database::"Sales Cr.Memo Header");
                            if SalesCrMemoHeader.Get(rec."Document Type", rec."No.") then
                                recRef.GetTable(SalesCrMemoHeader);
                        end;

                    Database::"Sales Invoice Header":
                        begin
                            recRef.Open(Database::"Sales Invoice Header");
                            if SalesInvoiceHeader.Get(rec."Document Type", rec."No.") then
                                recRef.GetTable(SalesInvoiceHeader);
                        end;

                    Database::"Purch. Inv. Header":
                        begin
                            recRef.Open(Database::"Purch. Inv. Header");
                            if PurchInvHeader.Get(rec."Document Type", rec."No.") then
                                recRef.GetTable(PurchInvHeader);
                        end;

                    Database::"Purch. Cr. Memo Hdr.":
                        begin
                            recRef.Open(Database::"Purch. Cr. Memo Hdr.");
                            if PurchCrMemoHdr.Get(rec."Document Type", rec."No.") then
                                recRef.GetTable(PurchCrMemoHdr);
                        end;

                    else
                        OnBeforeDrillDown(Rec, RecRef);


                end;

                DocumentAttachmentDetails.OpenForRecRef(RecRef);
                DocumentAttachmentDetails.RunModal;

            end;

        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;



    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    begin
    end;

    trigger OnAfterGetCurrRecord()
    var
        currentFilterGroup: Integer;
    begin
        currentFilterGroup := rec.FilterGroup;

        rec.FilterGroup := 4;

        NumberOfRecords := 0;
        if rec.GetFilters() <> '' then
            NumberOfRecords := rec.Count;
        rec.FilterGroup := currentFilterGroup;
    end;

    var
        NumberOfRecords: Integer;


}

