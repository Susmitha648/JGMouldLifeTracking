page 50152 "Mould Master Card"
{
    ApplicationArea = All;
    Caption = 'Mould Master Card';
    PageType = Card;
    SourceTable = "Mould Master";
    RefreshOnActivate = True;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Mould ID"; Rec."PO No.")
                {
                    ToolTip = 'Specifies the value of the Mould Id field.', Comment = '%';
                }
                field("Mould Name"; Rec."Mould Name")
                {
                    ToolTip = 'Specifies the value of the Mould Name field.', Comment = '%';
                    Visible = false;
                }
                field("Mould Size"; Rec."Mould Size")
                {
                    ToolTip = 'Specifies the value of the Mould Size field.', Comment = '%';
                    Visible = false;
                }
                field("Glass Weight"; Rec."Glass Weight")
                {
                    ToolTip = 'Specifies the value of the Glass Weight field.', Comment = '%';
                    BlankZero = true;
                }
                field("Received Date"; Rec."Received Date")
                {
                    ToolTip = 'Specifies the value of the Received Date field.', Comment = '%';
                }
                field("Gobcut/MLD"; Rec."Gobcut/MLD")
                {
                    ToolTip = 'Specifies the value of the Gobcut/MLD field.', Comment = '%';
                }
                field("Mould Qty"; Rec."Mould Qty")
                {
                    ToolTip = 'Specifies the value of the Mould Qty field.', Comment = '%';
                    BlankZero = true;
                }
                field("Blank Qty"; Rec."Blank Qty")
                {
                    ToolTip = 'Specifies the value of the Gobcut/MLD field.', Comment = '%';
                    BlankZero = true;
                }
                field("Blank Mould Life (Balance)"; Rec."Blank Mould Life (Balance)")
                {
                    ToolTip = 'Specifies the value of the Blank Mould Life (Balance) field.', Comment = '%';
                }field("Blow Mould Life (Balance)"; Rec."Blow Mould Life (Balance)")
                {
                    ToolTip = 'Specifies the value of the Blow Mould Life (Balance) field.', Comment = '%';
                }field("Blank Mould Life (Expected)"; Rec."Blank Mould Life (Expected)")
                {
                    ToolTip = 'Specifies the value of the Blank Mould Life (Expected) field.', Comment = '%';
                    BlankZero = true;
                }field("Blow Mould Life (Expected)"; Rec."Blow Mould Life (Expected)")
                {
                    ToolTip = 'Specifies the value of the Blow Mould Life (Expected) field.', Comment = '%';
                    BlankZero = true;
                }field("Blank Mould Life (Usage)"; Rec."Blank Mould Life (Usage)")
                {
                    ToolTip = 'Specifies the value of the Blank Mould Life (Usage) field.', Comment = '%';
                }field("Blow Mould Life (Usage)"; Rec."Blow Mould Life (Usage)")
                {
                    ToolTip = 'Specifies the value of the Blow Mould Life (Usage) field.', Comment = '%';
                }
                field("Blank Mould Life Usage %"; Rec."Blank Mould Life Usage %")
                {
                    ToolTip = 'Specifies the value of the Blank Mould Life Usage % field.', Comment = '%';
                }
                 field("Blow Mould Life Usage %"; Rec."Blow Mould Life Usage %")
                {
                    ToolTip = 'Specifies the value of the Blow Mould Life Usage % field.', Comment = '%';
                }
                field("Machine Center"; Rec."Machine Center")
                {
                    ToolTip = 'Specifies the value of the Machine Center field.', Comment = '%';
                }
                field("Holder Assembly No (Blank)"; Rec."Holder Assembly No (Blank)")
                {
                    ToolTip = 'Specifies the value of the Holder Assembly No (Blank) field.', Comment = '%';
                    BlankZero = true;
                }
                field("Holder Assembly No (Mould)"; Rec."Holder Assembly No (Mould)")
                {
                    ToolTip = 'Specifies the value of the Holder Assembly No (Mould) field.', Comment = '%';
                    BlankZero = true;
                }
                field(Invert; Rec.Invert)
                {
                    ToolTip = 'Specifies the value of the Invert field.', Comment = '%';
                    BlankZero = true;
                }
                field("Work Center"; Rec."Work Center")
                {
                    ToolTip = 'Specifies the value of the Work Center field.', Comment = '%';
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    ToolTip = 'Specifies the value of the Manufacturer field.', Comment = '%';
                }
                field("Weight Growth"; Rec."Weight Growth")
                {
                    ToolTip = 'Specifies the value of the Weight Growth field.', Comment = '%';
                }
                field("Current Weight Production"; Rec."Current Weight Production")
                {
                    ToolTip = 'Specifies the value of the Current Weight Production field.', Comment = '%';
                }
                 field("Weight Category"; Rec."Weight Category")
                {
                    ToolTip = 'Specifies the value of the Weight Category field.', Comment = '%';
                }
                   field("Mould Category"; Rec."Mould Category")
                {
                    ToolTip = 'Specifies the value of the Mould Category field.', Comment = '%';
                }
                 field(Process; Rec.Process)
                {
                    ToolTip = 'Specifies the value of the Process field.', Comment = '%';
                }
                field(Remarks; Rec.Remarks)
                {
                    ToolTip = 'Specifies the value of the Remarks.', Comment = '%';
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        If Rec."Blank Mould Life (Expected)" <> 0 then begin
            Rec.CalcFields("Blank Mould Life (Usage)");
            Rec."Blank Mould Life Usage %" := (Rec."Blank Mould Life (Usage)" / Rec."Blank Mould Life (Expected)") * 100;
            Rec."Blank Mould Life (Balance)" := Rec."Blank Mould Life (Expected)" - Rec."Blank Mould Life (Usage)";
        end;
        If Rec."Blow Mould Life (Expected)" <> 0 then begin
         Rec.CalcFields("Blow Mould Life (Usage)");
            Rec."Blow Mould Life Usage %" := (Rec."Blow Mould Life (Usage)" / Rec."Blow Mould Life (Expected)") * 100;
            Rec."Blow Mould Life (Balance)" := Rec."Blow Mould Life (Expected)" - Rec."Blow Mould Life (Usage)";
        end;
    end;
}
