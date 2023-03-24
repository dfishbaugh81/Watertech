tableextension 50126 "ISS Vendor Extension" extends "Vendor"
{


    fields
    {
        field(50110; VendorGLAccount; Code[30])
        {
            TableRelation = "G/L Account"."No." WHERE("Account Type" = FILTER(Posting));

        }
    }
}