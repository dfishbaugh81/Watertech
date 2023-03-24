pageextension 50155 "Vendor Card Extension" extends "Vendor Card"
{
    layout
    {

        addlast(General)
        {
            field(VendorGLAccount; rec.VendorGLAccount)
            {
                ApplicationArea = All;
                Caption = 'Invoicing G/L Account';
                trigger OnValidate()
                begin

                end;
            }
        }
    }

}