page 50150 "Mould Master"
{
    ApplicationArea = All;
    Caption = 'Mould Master';
    PageType = List;
    SourceTable = "Mould Master";
    UsageCategory = Lists;
    CardPageId = "Mould Master Card";
    Editable = False;
    DeleteAllowed = false;
    RefreshOnActivate = True;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
                field("Mould Weight"; Rec."Glass Weight")
                {
                    ToolTip = 'Specifies the value of the Mould Weight field.', Comment = '%';
                }
                field("Mould Purchase Date"; Rec."Received Date")
                {
                    ToolTip = 'Specifies the value of the Mould Purchase Date field.', Comment = '%';
                }
                field("Machine Center"; Rec."Machine Center")
                {
                    ToolTip = 'Specifies the value of the Machine Center field.', Comment = '%';
                }

                field("Mould Model"; Rec."Mould Model")
                {
                    ToolTip = 'Specifies the value of the Mould Model field.', Comment = '%';
                    Visible = false;
                }
                field("Work Center"; Rec."Work Center")
                {
                    ToolTip = 'Specifies the value of the Work Center field.', Comment = '%';
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    ToolTip = 'Specifies the value of the Manufacturer field.', Comment = '%';
                }
                field(Remarks; Rec.Remarks)
                {
                    ToolTip = 'Specifies the value of the Remarks.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ModuleGearLiftReport)
            {
                ApplicationArea = All;
                Caption = 'Print Module Gear Lift';
                Image = Report; // Optional icon
                trigger OnAction()
                var
                    MyReportID: Integer;
                    DocumentNo: Record "Mould Master";
                begin
                    MyReportID := Report::MouldGearLiftReport;
                    DocumentNo.Reset();
                    DocumentNo.SetRange("PO No.", Rec."PO No.");
                    If DocumentNo.FindSet() then
                        Report.RunModal(MyReportID, true, false, DocumentNo);
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.CalcFields("Blank Mould Life (Usage)", "Blow Mould Life (Usage)");
    end;
}
