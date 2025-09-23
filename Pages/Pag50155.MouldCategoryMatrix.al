page 50155 "Mould Category Matrix"
{
    ApplicationArea = All;
    Caption = 'Mould Category Matrix';
    PageType = List;
    SourceTable = "Mould Category Matrix";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Category; Rec.Category)
                {
                    ToolTip = 'Specifies the value of the Category field.', Comment = '%';
                }
                field("Gobcut/MLD"; Rec."Gobcut/MLD")
                {
                    ToolTip = 'Specifies the value of the Gobcut/MLD field.', Comment = '%';
                }
                field("Glass Weight From"; Rec."Glass Weight From")
                {
                    ToolTip = 'Specifies the value of the Glass Weight From field.', Comment = '%';
                }
                field("Glass Weight To"; Rec."Glass Weight To")
                {
                    ToolTip = 'Specifies the value of the Glass Weight To field.', Comment = '%';
                }
                field(Process; Rec.Process)
                {
                    ToolTip = 'Specifies the value of the Process field.', Comment = '%';
                }
            }
        }
    }
}
