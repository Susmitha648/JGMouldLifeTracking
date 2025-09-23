page 50154 "Preventive Maintenance BOM"
{
    ApplicationArea = All;
    Caption = 'Preventive Maintenance BOM';
    PageType = List;
    SourceTable = "Preventive Maintenance BOM";
    UsageCategory = Lists;
    CardPageId = "Preventive Maint BOM Card";
    Editable = false;
    DeleteAllowed = false;
    AutoSplitKey = true;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Asset No."; Rec."Asset No.")
                {
                    ToolTip = 'Specifies the value of the Asset No. field.', Comment = '%';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
     trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        FixedAsset: Record "Fixed Asset";
    begin
        FixedAsset.Get(Rec."Asset No.");
        
    end;
}
