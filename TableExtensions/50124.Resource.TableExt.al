tableextension 50124 "ResourceTableEx" extends Resource
{
    fields
    {
        // Add changes to table fields here
        field(50121; ResourceCatCode; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Resouce Category Code';
            TableRelation = "Item Category";
        }
    }

    var
        myInt: Integer;
}