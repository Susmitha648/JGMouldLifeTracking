table 50154 "Mould Tool Linkage"
{
    Caption = 'Mould Tool Linkage';
    DataClassification = CustomerContent;
    LookupPageId = "Mould Tool Linkage";
    fields
    {
        field(1; "PO No."; Code[20])
        {
            Caption = 'PO No.';
            TableRelation = "Mould Master"."PO No.";
        }
        field(2; "Mould Type"; Enum Process)
        {
            Caption = 'Mould Type';
        }
        field(3; Routings; Code[20])
        {
            Caption = 'Routings';
            TableRelation = "Routing Header"."No.";
        }
    }
    keys
    {
        key(PK; "PO No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Dropdown; "PO No.", "Mould Type", Routings) { }
    }

}
