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
                field("Job No."; Rec."Job No.")
                {
                    ToolTip = 'Specifies the value of the Job No. field.', Comment = '%';
                }
                field("Blank Mould Life (Expected)"; Rec."Blank Mould Life (Expected)")
                {
                    ToolTip = 'Specifies the value of the Blank Mould Life (Expected) field.', Comment = '%';
                }
                field("Blow Mould Life (Expected)"; Rec."Blow Mould Life (Expected)")
                {
                    ToolTip = 'Specifies the value of the Blow Mould Life (Expected) field.', Comment = '%';
                }
                field("Blank Mould Life (Balance)"; Rec."Blank Mould Life (Balance)")
                {
                    ToolTip = 'Specifies the value of the Blank Mould Life (Balance) field.', Comment = '%';
                }
                field("Blow Mould Life (Balance)"; Rec."Blow Mould Life (Balance)")
                {
                    ToolTip = 'Specifies the value of the Blow Mould Life (Balance) field.', Comment = '%';
                }
                field("Blank Mould Life (Usage)"; Rec."Blank Mould Life (Usage)")
                {
                    ToolTip = 'Specifies the value of the Blank Mould Life (Usage) field.', Comment = '%';
                }
                field("Blow Mould Life (Usage)"; Rec."Blow Mould Life (Usage)")
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
                field("Mould Purchase Date"; Rec."Received Date")
                {
                    ToolTip = 'Specifies the value of the Mould Purchase Date field.', Comment = '%';
                }
                field("Machine Center"; Rec."Machine Center")
                {
                    ToolTip = 'Specifies the value of the Machine Center field.', Comment = '%';
                }
                field("Shared Job"; Rec."Shared Job")
                {
                    ToolTip = 'Specifies the value of the Shared Job field.', Comment = '%';
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
                field(Scrapped; Rec.Scrapped)
                {
                    ToolTip = 'Specifies the value of the Scrapped.', Comment = '%';
                }
                field("Mould Status"; Rec."Mould Status")
                {
                    ToolTip = 'Specifies the value of the Mould Status.', Comment = '%';
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
            action(UpdateRoutingLink)
            {
                ApplicationArea = All;
                Caption = 'Update Tool Linkage';
                Image = UpdateDescription; // Optional icon
                trigger OnAction()
                var
                    RoutingLinkage: Record "Mould Tool Linkage";
                    RoutingLinkageTemp: Record "Mould Tool Linkage" temporary;
                begin
                    RoutingLinkageTemp.DeleteAll();
                    Rec."Shared Job" := '';
                    RoutingLinkage.Reset();
                    RoutingLinkage.SetRange("PO No.", Rec."PO No.");
                    If RoutingLinkage.FindSet() then
                        repeat
                            RoutingLinkageTemp.Reset();
                            RoutingLinkageTemp.SetRange("PO No.", Rec."PO No.");
                            RoutingLinkageTemp.SetRange(Routings, RoutingLinkage.Routings);
                            If Not RoutingLinkageTemp.FindFirst() then begin
                                RoutingLinkageTemp.Init();
                                RoutingLinkageTemp."PO No." := Rec."PO No.";
                                RoutingLinkageTemp."Mould Type" := RoutingLinkage."Mould Type";
                                RoutingLinkageTemp.Routings := RoutingLinkage.Routings;
                                RoutingLinkageTemp.Insert();
                                Rec."Shared Job" += RoutingLinkage.Routings + ',';
                                
                            end;
                        until RoutingLinkage.Next() = 0;
                    If Rec."Shared Job" <> '' then
                        Rec."Shared Job" := COPYSTR(Rec."Shared Job", 1, STRLEN(Rec."Shared Job") - 1);
                    Rec.Modify();
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.CalcFields("Blank Mould Life (Usage)", "Blow Mould Life (Usage)");
    end;
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
