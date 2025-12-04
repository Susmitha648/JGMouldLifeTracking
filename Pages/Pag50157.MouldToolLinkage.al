page 50157 "Mould Tool Linkage"
{
    ApplicationArea = All;
    Caption = 'Mould Tool Linkage';
    PageType = List;
    SourceTable = "Mould Tool Linkage";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("PO No."; Rec."PO No.")
                {
                    ToolTip = 'Specifies the value of the PO No. field.', Comment = '%';
                }
                field("Mould Type"; Rec."Mould Type")
                {
                    ToolTip = 'Specifies the value of the Mould Type field.', Comment = '%';
                }
                field(Routings; Rec.Routings)
                {
                    ToolTip = 'Specifies the value of the Routings field.', Comment = '%';
                }
            }
        }
    }
}
