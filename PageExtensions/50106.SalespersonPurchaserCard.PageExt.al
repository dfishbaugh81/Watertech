pageextension 50106 "SalesPersonExPage" extends "Salesperson/Purchaser Card"
{
    layout
    {
        // Add changes to page layout here

        addafter(Invoicing)
        {
            group("Current Goals")
            {
                field(NewGrossProfit; Rec.NewGrossProfit)
                {
                    ApplicationArea = All;

                }

                field(NewSalesGP; rec.NewSalesGP)
                {
                    ApplicationArea = All;
                }
            }

            group("Historical Goals")
            {
                field(HistoricalGrossProfit; Rec.HistoricalGrossProfit)
                {
                    ApplicationArea = All;

                }

                field(HistoricalSalesGP; rec.HistoricalSalesGP)
                {
                    ApplicationArea = All;
                }
            }


        }

        addafter("Next Task Date")
        {

            field(SalesPerson_industryType; rec.SalesPerson_industryType)
            {
                ApplicationArea = All;



            }

            field(PTOHours; rec.PTOHours)
            {
                ApplicationArea = All;

            }
            /*
                        field(SalesPerson_UserId; rec.SalesPerson_UserId)
                        {
                            ApplicationArea = All;

                        }


                                    field(SalesPersonCode_UserId; rec.SalesPersonCode_UserId)
                                    {
                                        ApplicationArea = All;

                                    }

                                    */




        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}