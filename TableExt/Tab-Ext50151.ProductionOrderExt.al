tableextension 50151 "Production Order Ext" extends "Production Order"
{
    fields
    {
        field(50150; "PO No."; Code[20])
        {
            Caption = 'PO No.';
            DataClassification = CustomerContent;
            TableRelation = "Mould Master"."PO No.";
        }
    }
}
