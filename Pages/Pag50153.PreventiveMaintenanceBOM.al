page 50153 "Preventive Maint BOM Card"
{
    ApplicationArea = All;
    Caption = 'Preventive Maintenance BOM Card';
    PageType = Card;
    SourceTable = "Preventive Maintenance BOM";
    AutoSplitKey = true;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
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
}
