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
        field(2; "Process"; Enum Process)
        {
            Caption = 'Process';
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
        field(5; "Work Center"; Code[20])
        {
            Caption = 'Work Center';
            trigger OnLookup()
            var
                GeneralLegderSetup: Record "General Ledger Setup";
                DimensionValue: Record "Dimension Value";
            begin
                GeneralLegderSetup.Get();
                DimensionValue.Reset();
                DimensionValue.SetRange("Dimension Code", GeneralLegderSetup."Shortcut Dimension 8 Code");
                If DimensionValue.FindSet() then;
                if Page.RunModal(537, DimensionValue) = Action::LookupOK then
                    "Work Center" := DimensionValue.Code;
            end;
        }
        field(6; "Production Order No."; Code[20])
        {
            Caption = 'Production Order No';
            TableRelation = "Production Order"."No.";
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
        field(8; "Work Shift"; Code[20])
        {
            Caption = 'Work Shift';
            TableRelation = "Work Shift".Code;
        }
        field(9; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Item."No.";
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
