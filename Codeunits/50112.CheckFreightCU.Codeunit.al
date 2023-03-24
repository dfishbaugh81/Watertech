codeunit 50112 "CheckFreightCU"
{


    Permissions = TableData "Sales Invoice Line" = RIMD,
                  TableData "Sales Cr.Memo Line" = RIMD;

    trigger OnRun()
    begin

        UpdateShippingAgentName();

    end;

    var
        myInt: Integer;


    procedure CheckFreightShpCodeFromLineProcedure(var PostedInv: Record "Sales Invoice Header")
    var
        PostedSalesLines: Record "Sales Invoice Line";
        SalesLinesTempTable: Record SalesLineTempTable;
        PostedSalesHeader: Record "Sales Invoice Header";
    begin


        PostedSalesLines.SetFilter("Document No.", '=%1', PostedInv."No.");

        if PostedSalesLines.FindSet then begin
            repeat

                SalesLinesTempTable.SetFilter(IN_DocNo, '=%1', PostedSalesLines."Order No.");
                if SalesLinesTempTable.FindSet then begin

                    repeat

                        if PostedSalesLines."No." = SalesLinesTempTable.IN_ItemNo then begin
                            PostedSalesLines."Include Freight" := SalesLinesTempTable.IN_IncludeFreight;
                            PostedSalesLines.IN_ShippingAgentCode := SalesLinesTempTable.IN_ShippingAgent;

                            PostedSalesLines.Modify;

                            SalesLinesTempTable.Delete;
                        end;



                    until SalesLinesTempTable.Next = 0;

                end;


            until PostedSalesLines.Next = 0;
        end;



    end;

    procedure CheckFreightShpCodeFromListProcedure()
    var
        PostedSalesLines: Record "Sales Invoice Line";
        SalesLinesTempTable: Record SalesLineTempTable;
        PostedSalesHeader: Record "Sales Invoice Header";
    begin

        repeat
            PostedSalesLines.SetFilter("Document No.", '=%1', PostedSalesHeader."No.");

            if PostedSalesLines.FindSet then begin
                repeat



                    SalesLinesTempTable.SetFilter(IN_DocNo, '=%1', PostedSalesLines."Order No.");
                    if SalesLinesTempTable.FindSet then begin

                        repeat

                            if PostedSalesLines."No." = SalesLinesTempTable.IN_ItemNo then begin

                                PostedSalesLines."Include Freight" := SalesLinesTempTable.IN_IncludeFreight;
                                PostedSalesLines.IN_ShippingAgentCode := SalesLinesTempTable.IN_ShippingAgent;
                                PostedSalesLines.Modify;

                                SalesLinesTempTable.Delete;
                            end;



                        until SalesLinesTempTable.Next = 0;

                    end;


                until PostedSalesLines.Next = 0;
            end;

        until PostedSalesHeader.Next = 0;

        Message('Lines Updated Succesfully!');



    end;



    local procedure UpdateShippingAgentName()
    var
        PostedSalesInvoiceLines: Record "Sales Invoice Line";
        ShippingAgent: Record "Shipping Agent";
    begin

        repeat

            if PostedSalesInvoiceLines.IN_ShippingAgentCode <> '' then begin



                ShippingAgent.SetFilter(Code, '=%1', PostedSalesInvoiceLines.IN_ShippingAgentCode);

                if ShippingAgent.FindSet then begin

                    PostedSalesInvoiceLines.IN_ShippingAgentName := ShippingAgent.Name;
                    PostedSalesInvoiceLines.Modify;
                end;
            end;

        until PostedSalesInvoiceLines.Next = 0;

    end;
}