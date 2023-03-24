tableextension 50125 "PurchaseHeaderEx" extends "Purchase Header"
{

    trigger OnAfterInsert()
    begin
        ValidateGLLine();

    end;

    trigger OnAfterModify()
    begin

        if Status = Status::Open then begin

            ValidateGLLineAfterModify();
        end;


    end;



    local procedure ValidateGLLine()
    var
        Vendor: Record Vendor;
        PurchaseLine: Record "Purchase Line";
    begin
        if ("No." = '') or ("Buy-from Vendor No." = '') then
            exit;

        Vendor.RESET();
        if Vendor.Get(Rec."Buy-from Vendor No.") then begin
            if Vendor.VendorGLAccount <> '' then begin
                PurchaseLine.RESET();
                PurchaseLine.SETRANGE("Document No.", Rec."No.");
                PurchaseLine.SETRANGE("Document Type", Rec."Document Type");
                PurchaseLine.SETRANGE(Type, PurchaseLine.Type::"G/L Account");
                PurchaseLine.SETRANGE(Quantity, 1);
                PurchaseLine.SETRANGE("No.", Vendor.VendorGLAccount);
                if PurchaseLine.FIND('-') = false then begin
                    PurchaseLine.RESET();
                    PurchaseLine.INIT();
                    PurchaseLine.Validate("Document Type", Rec."Document Type");
                    PurchaseLine.Validate("Document No.", Rec."No.");
                    PurchaseLine.Validate(Type, PurchaseLine.Type::"G/L Account");
                    PurchaseLine.Validate(Quantity, 1);
                    PurchaseLine.Validate("No.", Vendor.VendorGLAccount);

                    PurchaseLine.Insert(true);
                end;
            end;
        end;

    end;


    local procedure ValidateGLLineAfterModify()
    var
        Vendor: Record Vendor;
        PurchaseLine: Record "Purchase Line";
    begin
        if ("No." = '') or ("Buy-from Vendor No." = '') then
            exit;

        Vendor.RESET();
        if Vendor.Get(Rec."Buy-from Vendor No.") then begin
            if Vendor.VendorGLAccount <> '' then begin
                PurchaseLine.RESET();
                PurchaseLine.SETRANGE("Document No.", Rec."No.");
                PurchaseLine.SETRANGE("Document Type", Rec."Document Type");
                PurchaseLine.SETRANGE(Type, PurchaseLine.Type::"G/L Account");
                PurchaseLine.SETRANGE(Quantity, 1);
                PurchaseLine.SETRANGE("No.", Vendor.VendorGLAccount);
                if PurchaseLine.FIND('-') = false then begin
                    PurchaseLine.RESET();
                    PurchaseLine.INIT();
                    PurchaseLine.Validate("Document Type", Rec."Document Type");
                    PurchaseLine.Validate("Document No.", Rec."No.");
                    PurchaseLine.Validate(Type, PurchaseLine.Type::"G/L Account");
                    PurchaseLine.Validate(Quantity, 1);
                    PurchaseLine.Validate("No.", Vendor.VendorGLAccount);

                    PurchaseLine.Modify();
                end;
            end;
        end;

    end;




}