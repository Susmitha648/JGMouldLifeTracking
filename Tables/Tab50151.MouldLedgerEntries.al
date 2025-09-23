table 50151 "Mould Ledger Entries"
{
    Caption = 'Mould Ledger Entries';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Mould Ledger Entries";
    DataPerCompany = true;
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            //AutoIncrement = true;
        }
        field(2; "Type"; Enum "Mould Usage")
        {
            Caption = 'Type';
        }
        field(3; "PO No."; Code[20])
        {
            Caption = 'PO No.';
            TableRelation = "Mould Master"."PO No.";
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(5; "Machine Center"; Code[20])
        {
            Caption = 'Machine Center';
            TableRelation = "Machine Center"."No.";
        }
        field(6; "Production Order No."; Code[20])
        {
            Caption = 'Production Order No';
        }
        field(7; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            trigger OnValidate()
            var
                MouldLedgerEntries: Record "Mould Ledger Entries";
                MouldMaster: Record "Mould Master";
                RemainingQty: Decimal;
            begin
                

            end;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    
}
