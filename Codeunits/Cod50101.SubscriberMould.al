codeunit 50150 "Subscriber Mould"
{
    SingleInstance = true;
    [EventSubscriber(ObjectType::Table, Database::"Prod. Order Line", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterTransProdOrder(var Rec: Record "Prod. Order Line"; var xRec: Record "Prod. Order Line")
    var
        MouldMaster: Record "Mould Master";
        MouldLedgerEntries: Record "Mould Ledger Entries";
        MouldRoutingLinkage: Record "Mould Tool Linkage";
        ProdOrder: Record "Production Order";
        MLE: Record "Mould Ledger Entries";
        Item: Record Item;
        BlankQty: Decimal;
        BlowQty: Decimal;
    begin
        If Item.Get(Rec."Item No.") then
            If Item."Item Category Code" = 'PB' then begin
                ProdOrder.Reset();
                ProdOrder.SetRange(Status, Rec.Status);
                ProdOrder.SetRange("No.", Rec."Prod. Order No.");
                ProdOrder.SetFilter("Production Programme", '<>%1', '');
                If ProdOrder.FindFirst() then
                    If Rec."Finished Quantity" <> OldRec."Finished Quantity" then begin
                        MouldRoutingLinkage.Reset();
                        MouldRoutingLinkage.SetRange(Routings, Rec."Routing No.");
                        If MouldRoutingLinkage.FindSet() then
                            repeat
                                If MouldMaster.Get(MouldRoutingLinkage."PO No.") then;
                                MLE.Init();
                                MouldLedgerEntries.SetAscending("Entry No.", false);
                                If MouldLedgerEntries.Findfirst() then
                                    MLE."Entry No." := MouldLedgerEntries."Entry No." + 1
                                else
                                    MLE."Entry No." := 1;
                                MLE."PO No." := MouldMaster."PO No.";
                                MLE."Production Order No." := Rec."Prod. Order No.";
                                MLE."Posting Date" := WorkDate();
                                If OldRec."Finished Quantity" = 0 then
                                    MLE.Quantity := Rec."Finished Quantity"
                                else
                                    MLE.Quantity := Rec."Finished Quantity" - OldRec."Finished Quantity";
                                MLE.Type := MouldRoutingLinkage."Mould Type";
                                MLE."Work Shift" := Rec."Work Shift";
                                MLE."Job No." := Rec."Item No.";
                                MLE."Work Center" := Rec."Location Code";
                                MLE.Insert();
                            until MouldRoutingLinkage.Next() = 0;
                    end;
            end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Prod. Order Line", 'OnBeforeModifyEvent', '', false, false)]
    local procedure OnBeforeTransProdOrder(var Rec: Record "Prod. Order Line"; var xRec: Record "Prod. Order Line")
    var
        MouldMaster: Record "Mould Master";
        MouldLedgerEntries: Record "Mould Ledger Entries";
        MouldRoutingLinkage: Record "Mould Tool Linkage";
        MLE: Record "Mould Ledger Entries";
        BlankQty: Decimal;
        BlowQty: Decimal;
    begin

        SelectLatestVersion();
        If OldRec.Get(Rec.Status, Rec."Prod. Order No.", Rec."Line No.") then;
    end;

    var
        OldRec: Record "Prod. Order Line";
}
