tableextension 50114 "ContractsEx" extends "LEP Contract"
{

    fields
    {
        // Add changes to table fields here
        field(50114; IMP_ContractTypes; Enum Imp_ContractTypes)
        {
            DataClassification = ToBeClassified;
            Caption = 'Contract Types';
        }


        field(50115; IMP_CustomerName; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "LEP Contract"."Partner Name";

        }

        field(50116; IMP_ContractStatus; Enum IMP_ContractStatus)
        {
            DataClassification = ToBeClassified;
            Caption = 'Contract Status';
        }


    }

    var
        myInt: Integer;
}