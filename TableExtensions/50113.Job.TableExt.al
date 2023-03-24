tableextension 50113 "MyExtension" extends Job
{
    fields
    {
        // Add changes to table fields here

        field(50113; JobTypes; Enum JobTypes)
        {
            DataClassification = ToBeClassified;
            Caption = 'Job Types';
        }


    }

    var
        myInt: Integer;
}