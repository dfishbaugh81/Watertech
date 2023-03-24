codeunit 50110 "PostSalesOrder"

{

    Permissions = TableData "Sales Invoice Line" = RIMD,
                  TableData "Sales Cr.Memo Line" = RIMD;


    trigger OnRun()
    var
        SalesInvoiceRecord: Record "Sales Header";
    begin

    end;




    procedure TempTableToPostedSalesOrderLines(var TempTableVar: Record "Sales Header")
    var
        PostedSalesLines: Record "Sales Invoice Line";
        SalesLinesTempTable: Record SalesLineTempTable;
        PostedSalesHeader: Record "Sales Invoice Header";
        ShippingAgent: Record "Shipping Agent";

    begin

        SalesLinesTempTable.SetFilter(IN_DocNo, '=%1', TempTableVar."No.");

        if SalesLinesTempTable.FindSet then begin

            repeat

                repeat
                    PostedSalesHeader.SetFilter("Order No.", '=%1', SalesLinesTempTable.IN_DocNo);
                    if PostedSalesHeader.FindSet then begin


                        PostedSalesLines.SetFilter("Document No.", '=%1', PostedSalesHeader."No.");

                        if PostedSalesLines.FindSet then begin


                            PostedSalesLines.SetFilter("Line No.", '=%1', SalesLinesTempTable."Line No.");

                            if PostedSalesLines.FindSet then begin


                                PostedSalesLines."Include Freight" := SalesLinesTempTable.IN_IncludeFreight;
                                PostedSalesLines.IN_ShippingAgentCode := SalesLinesTempTable.IN_ShippingAgent;

                                if PostedSalesLines.IN_ShippingAgentCode <> '' then begin

                                    ShippingAgent.SetFilter(Code, '=%1', PostedSalesLines.IN_ShippingAgentCode);

                                    if ShippingAgent.FindSet then begin

                                        PostedSalesLines.IN_ShippingAgentName := ShippingAgent.Name;
                                    end;


                                end;

                                PostedSalesLines.Modify;

                                SalesLinesTempTable.Delete;


                            end;

                        end;

                    end;

                until SalesLinesTempTable.Next = 0;

            until PostedSalesLines.Next = 0;

        end;

    end;



    procedure SalesOrderLinesToTempTable_2(var SalesLineRecord: Record "Sales Line")
    var
        SalesLines: Record "Sales Line";

        NextLineNo: Integer;

        ShippingAgent: Record "Shipping Agent";

    begin


        if (SalesLineRecord."Include Freight") OR (SalesLineRecord."Shipping Agent Code" <> '') then begin

            SalesLines.SetFilter("Document No.", '=%1', SalesLineRecord."Document No.");
            if SalesLines.FindSet then begin

                SalesLinesTempTable.SetFilter(IN_DocNo, '=%1', SalesLines."Document No.");

                if SalesLinesTempTable.FindSet then begin

                    SalesLinesTempTable.SetFilter("Line No.", '=%1', SalesLineRecord."Line No.");


                    if SalesLinesTempTable.FindSet then begin


                        SalesLinesTempTable.IN_DocNo := SalesLineRecord."Document No.";
                        SalesLinesTempTable.IN_ItemNo := SalesLineRecord."No.";
                        SalesLinesTempTable.IN_ShippingAgent := SalesLineRecord."Shipping Agent Code";
                        SalesLinesTempTable.IN_IncludeFreight := SalesLineRecord."Include Freight";
                        SalesLinesTempTable."Line No." := SalesLineRecord."Line No.";

                    end

                    else begin

                        SalesLinesTempTable.IN_DocNo := SalesLineRecord."Document No.";
                        SalesLinesTempTable.IN_ItemNo := SalesLineRecord."No.";
                        SalesLinesTempTable.IN_ShippingAgent := SalesLineRecord."Shipping Agent Code";
                        SalesLinesTempTable.IN_IncludeFreight := SalesLineRecord."Include Freight";
                        SalesLinesTempTable."Line No." := SalesLineRecord."Line No.";

                        SalesLinesTempTable.Insert;

                    end;

                end
                else begin

                    SalesLinesTempTable.IN_DocNo := SalesLineRecord."Document No.";
                    SalesLinesTempTable.IN_ItemNo := SalesLineRecord."No.";
                    SalesLinesTempTable.IN_ShippingAgent := SalesLineRecord."Shipping Agent Code";
                    SalesLinesTempTable.IN_IncludeFreight := SalesLineRecord."Include Freight";
                    SalesLinesTempTable."Line No." := SalesLineRecord."Line No.";

                    SalesLinesTempTable.Insert;

                end;



            end;



        end;

        /*

        Original Code Just in case

        if (SalesLineRecord."Include Freight") OR (SalesLineRecord."Shipping Agent Code" <> '') then begin

            SalesLines.SetFilter("Document No.", '=%1', SalesLineRecord."Document No.");
            if SalesLines.FindSet then begin

                SalesLinesTempTable.SetFilter(IN_DocNo, '=%1', SalesLines."Document No.");

                if SalesLinesTempTable.FindSet then begin


                    SalesLinesTempTable.IN_DocNo := SalesLineRecord."Document No.";
                    SalesLinesTempTable.IN_ItemNo := SalesLineRecord."No.";
                    SalesLinesTempTable.IN_ShippingAgent := SalesLineRecord."Shipping Agent Code";
                    SalesLinesTempTable.IN_IncludeFreight := SalesLineRecord."Include Freight";


                    SalesLinesTempTable."Line No." := SalesLineRecord."Line No.";

                    SalesLinesTempTable.Modify;
                end
                else begin

                    SalesLinesTempTable.IN_DocNo := SalesLineRecord."Document No.";
                    SalesLinesTempTable.IN_ItemNo := SalesLineRecord."No.";
                    SalesLinesTempTable.IN_ShippingAgent := SalesLineRecord."Shipping Agent Code";
                    SalesLinesTempTable.IN_IncludeFreight := SalesLineRecord."Include Freight";



                    SalesLinesTempTable."Line No." := SalesLineRecord."Line No.";

                    SalesLinesTempTable.Insert;

                end;



            end;



        end;
        */

    end;


    //Procedure to post to Sales Credit Memos

    procedure TempTableToPostedSalesCreditMemoLines(var TempTableVar: Record "Sales Header")
    var
        PostedSalesCrMemoLines: Record "Sales Cr.Memo Line";
        SalesLinesTempTable: Record SalesLineTempTable;
        PostedSalesCrMemoHeader: Record "Sales Cr.Memo Header";
        ShippingAgent: Record "Shipping Agent";

    begin

        SalesLinesTempTable.SetFilter(IN_DocNo, '=%1', TempTableVar."No.");

        if SalesLinesTempTable.FindSet then begin

            repeat

                repeat
                    PostedSalesCrMemoHeader.SetFilter("Pre-Assigned No.", '=%1', SalesLinesTempTable.IN_DocNo);
                    if PostedSalesCrMemoHeader.FindSet then begin


                        PostedSalesCrMemoLines.SetFilter("Document No.", '=%1', PostedSalesCrMemoHeader."No.");

                        if PostedSalesCrMemoLines.FindSet then begin


                            PostedSalesCrMemoLines.SetFilter("Line No.", '=%1', SalesLinesTempTable."Line No.");

                            if PostedSalesCrMemoLines.FindSet then begin

                                PostedSalesCrMemoLines."Include Freight" := SalesLinesTempTable.IN_IncludeFreight;
                                PostedSalesCrMemoLines.INSalesCreditShippingAgentCode := SalesLinesTempTable.IN_ShippingAgent;
                                //PostedSalesCrMemoHeader.

                                if PostedSalesCrMemoLines.INSalesCreditShippingAgentCode <> '' then begin

                                    ShippingAgent.SetFilter(Code, '=%1', PostedSalesCrMemoLines.INSalesCreditShippingAgentCode);

                                    if ShippingAgent.FindSet then begin

                                        PostedSalesCrMemoLines.ShippingAgentName := ShippingAgent.Name;
                                    end;


                                end;
                                PostedSalesCrMemoLines.Modify;

                                SalesLinesTempTable.Delete;


                            end;

                        end;

                    end;

                until SalesLinesTempTable.Next = 0;

            until PostedSalesCrMemoLines.Next = 0;

        end;

    end;







    procedure DeleteIfModified()
    var

    begin

        SalesLinesTempTable.DeleteAll;




    end;





    var

        SalesLinesTempTable: Record SalesLineTempTable;

}






