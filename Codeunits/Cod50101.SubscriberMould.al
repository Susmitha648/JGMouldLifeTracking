codeunit 50150 "Subscriber Mould"
{
    [EventSubscriber(ObjectType::Table, Database::"Prod. Order Line", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterTransProdOrder(var Rec: Record "Prod. Order Line"; var xRec: Record "Prod. Order Line")
    var
        MouldMaster: Record "Mould Master";
        MouldLedgerEntries: Record "Mould Ledger Entries";
        MouldRoutingLinkage: Record "Mould Tool Linkage";
        MLE: Record "Mould Ledger Entries";
        BlankQty: Decimal;
        BlowQty: Decimal;
    begin
        If Rec."Finished Quantity" <> xRec."Finished Quantity" then begin
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
                    If xRec."Finished Quantity" = 0 then
                        MLE.Quantity := Rec."Finished Quantity"
                    else
                        MLE.Quantity := xRec."Finished Quantity" - Rec."Finished Quantity";
                    MLE.Process := MouldRoutingLinkage."Mould Type";
                    MLE."Work Shift" := Rec."Work Shift";
                    MLE."Job No." := Rec."Item No.";
                    MLE."Work Center" := Rec."Location Code";
                    MLE.Insert();
                until MouldRoutingLinkage.Next() = 0;
        end;


    end;
}
