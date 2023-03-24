pageextension 50137 "SalesInvoiceHeaderEx" extends "Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        /*
                modify(Post)
                {


                    trigger OnAfterAction()
                    var
                        PostSalesOrder: Codeunit PostSalesOrder;

                    begin

                        PostSalesOrder.TempTableToPostedSalesInvoiceLines(Rec);

                    end;



                }

                modify(PostAndNew)
                {
                    trigger OnAfterAction()
                    var
                        PostSalesOrder: Codeunit PostSalesOrder;
                    begin

                        PostSalesOrder.TempTableToPostedSalesInvoiceLines(Rec);


                    end;
                }

                modify(PostAndSend)
                {
                    trigger OnAfterAction()
                    var
                        PostSalesOrder: Codeunit PostSalesOrder;
                    begin

                        PostSalesOrder.TempTableToPostedSalesInvoiceLines(Rec);


                    end;
                }


                */

    }



    var
        TempRecord: Record "Sales Line";








}
