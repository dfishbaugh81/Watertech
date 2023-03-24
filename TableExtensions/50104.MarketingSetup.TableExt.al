tableextension 50104 "MarketingSetupTableEx" extends "Marketing Setup"
{
    fields
    {
        // Boolean Switch that enables/disables the filter on the Contacts/Opportunity lists

        field(50120; SalesCodeSetup; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'SalesCode filter';

            trigger OnValidate()
            var
                myInt: Integer;
            begin

                if rec.SalesCodeSetup then begin
                    salesCodeVar := true;
                end

                else begin

                    salesCodeVar := false;
                end;

            end;

        }

        field(50102; CRMCustomerPostingGroup; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Insert Customer Posting Group';
        }
    }

    var
        salesCodeVar: Boolean;

}
