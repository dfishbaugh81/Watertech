tableextension 50123 "SalesCrMemoHeaderDocEx" extends "Sales Cr.Memo Header"
{
    fields
    {
        // Add changes to table fields here
        field(50121; IMP_JobType; Enum Sales_JobTypes)
        {
            DataClassification = ToBeClassified;
            Caption = 'Job Type';
        }
    }

    var
        myInt: Integer;
}