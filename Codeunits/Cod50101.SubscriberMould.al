codeunit 50150 "Subscriber Mould"
{
    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Prod. Order Status Management", 'OnAfterTransProdOrder', '', false, false)]
    local procedure OnAfterTransProdOrder(var FromProdOrder: Record "Production Order"; var ToProdOrder: Record "Production Order")
    var
        MouldMaster: Record "Mould Master";
        MouldLedgerEntries: Record "Mould Ledger Entries";
        MLE: Record "Mould Ledger Entries";
        BlankQty: Decimal;
        BlowQty: Decimal;
    begin
        If MouldMaster.Get(FromProdOrder."PO No.") then;
        MLE.Init();
        MouldLedgerEntries.SetAscending("Entry No.", false);
        If MouldLedgerEntries.Findfirst() then
            MLE."Entry No." := MouldLedgerEntries."Entry No." + 1
        else
            MLE."Entry No." := 1;
        MLE."PO No." := FromProdOrder."PO No.";
        MLE."Production Order No." := FromProdOrder."No.";
        MLE."Posting Date" := System.Today();
        MLE.Quantity := FromProdOrder.Quantity;
        If MouldMaster.Process = MouldMaster.Process::BB then
            MLE.Type := MLE.Type::"Blow & Blow (BB)"
        else
            MLE.Type := MLE.Type::"Press & Blow (PB)";
        MLE.Insert();
    end;
}
