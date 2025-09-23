codeunit 50150 "Subscriber Mould"
{
    [EventSubscriber(ObjectType::Table, Database::"Mould Ledger Entries", 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure OnAfterValidateLocationCodePurchase(var Rec: Record "Mould Ledger Entries"; var xRec: Record "Mould Ledger Entries"; CurrFieldNo: Integer)
    var
    MouldMaster : Record "Mould Master";
    MouldLedgerEntries : Record "Mould Ledger Entries";
    BlankQty : Decimal;
    BlowQty : Decimal;
    begin
        /*Clear(BlankQty);
        Clear(BlowQty);
       If MouldMaster.Get(Rec."PO No.") then begin
          MouldLedgerEntries.Reset();
          MouldLedgerEntries.SetRange("PO No.",Rec."PO No.");
          If MouldLedgerEntries.FindSet() then repeat
             If MouldLedgerEntries.Type = MouldLedgerEntries.Type::"Press & Blow (PB)" then
                BlankQty += MouldLedgerEntries.Quantity;
              If MouldLedgerEntries.Type = MouldLedgerEntries.Type::"Blow & Blow (BB)" then
                BlowQty += MouldLedgerEntries.Quantity;  
          until MouldLedgerEntries.Next() = 0;
          MouldMaster."Blow Mould Life Usage %" := (BlowQty/ MouldMaster."Blow Mould Life (Expected)") * 100;
          MouldMaster."Blank Mould Life Usage %" := (BlankQty / MouldMaster."Blank Mould Life (Expected)") * 100;
          MouldMaster."Blank Mould Life (Balance)" := MouldMaster."Blank Mould Life (Expected)" - BlankQty;
          MouldMaster."Blow Mould Life (Balance)" := MouldMaster."Blow Mould Life (Expected)" - BlowQty;
          MouldMaster.Modify();
       end;*/
    end;
}
