pageextension 50121 "CustomerCardEx" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("Disable Search by Name")
        {
            field(ExpectedAnnualSales; rec.ExpectedAnnualSales)
            {
                ApplicationArea = All;

            }

            field(ExpectedGP; rec.ExpectedGP)
            {
                ApplicationArea = All;

            }

            field(ServiceVisitsPerYr; rec.ServiceVisitsPerYr)
            {
                ApplicationArea = All;

            }

            field(HrsPerSrvcVisit; rec.HrsPerSrvcVisit)
            {
                ApplicationArea = All;

            }

            field(FreedomPlus; rec.FreedomPlus)
            {
                ApplicationArea = All;

            }

            field(FDALetter; rec.FDALetter)
            {
                ApplicationArea = All;

            }

            field(DateSold; rec.DateSold)
            {
                ApplicationArea = All;

            }

            field(PriorityCode; rec.PriorityCode)
            {
                ApplicationArea = All;

            }

            field(LostAccountStatus; rec.LostAccountStatus)
            {
                ApplicationArea = All;

            }

            field(IN_ServiceRep; rec.IN_ServiceRep)
            {
                ApplicationArea = All;

            }


        }

        addafter("Salesperson Code")
        {
            field(OverrideRep; rec.OverrideRep)
            {
                ApplicationArea = All;

            }


            field(BackUpRep; rec.BackUpRep)
            {
                ApplicationArea = All;

            }


            field(AccountReview; rec.AccountReview)
            {
                ApplicationArea = All;

            }


        }

        addlast(content)
        {

            group("Productivity Sheet")
            {
                Caption = 'Productivity Sheet';

                field("Service Rep Visits per Year"; rec."Service Rep Visits per Year")
                {
                    ApplicationArea = All;

                }

                field("Service Rep Hours per Visit"; rec."Service Rep Hours per Visit")
                {
                    ApplicationArea = All;

                }


            }

        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}