page 50151 "Mould Ledger Entries"
{
    ApplicationArea = All;
    Caption = 'Mould Ledger Entries';
    PageType = List;
    SourceTable = "Mould Ledger Entries";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field("Mould ID"; Rec."PO No.")
                {
                    ToolTip = 'Specifies the value of the Mould ID field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Machine Center"; Rec."Machine Center")
                {
                    ToolTip = 'Specifies the value of the Machine Center field.', Comment = '%';
                }
                field("Production Order No."; Rec."Production Order No.")
                {
                    ToolTip = 'Specifies the value of the Production Order No field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                    BlankZero = true;
                }


            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    var
    MouldLedgerEntries : Record "Mould Ledger Entries";
    begin
        If MouldLedgerEntries.FindLast() then
           Rec."Entry No." := MouldLedgerEntries."Entry No." + 1;
    end; 
}
