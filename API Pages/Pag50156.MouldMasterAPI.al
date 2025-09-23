page 50156 "MouldMaster API"
{
    APIGroup = 'apiGroup';
    APIPublisher = 'commit';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'mouldMasterAPI';
    DelayedInsert = true;
    EntityName = 'mouldMaster';
    EntitySetName = 'mouldMasters';
    PageType = API;
    SourceTable = "Mould Master";
    Editable = false;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(poNo; Rec."PO No.")
                {
                    Caption = 'PO No.';
                }
                field(mouldName; Rec."Mould Name")
                {
                    Caption = 'Mould Name';
                }
                field(mouldSize; Rec."Mould Size")
                {
                    Caption = 'Mould Size';
                }
                field(glassWeight; Rec."Glass Weight")
                {
                    Caption = 'Glass Weight';
                }
                field(receivedDate; Rec."Received Date")
                {
                    Caption = 'Received Date';
                }
                field(jobNo; Rec."Job No.")
                {
                    Caption = 'Job No.';
                }
                field(machineCenter; Rec."Machine Center")
                {
                    Caption = 'Machine Center';
                }
                field(blowMouldLifeUsage; Rec."Blow Mould Life (Usage)")
                {
                    Caption = 'Blow Mould Life (Usage)';
                }
                field(blowMouldLifeBalance; Rec."Blow Mould Life (Balance)")
                {
                    Caption = 'Blow Mould Life (Balance)';
                }
                field(mouldModel; Rec."Mould Model")
                {
                    Caption = 'Mould Model';
                }
                field(remarks; Rec.Remarks)
                {
                    Caption = 'Remarks';
                }
                field(gobcutMLD; Rec."Gobcut/MLD")
                {
                    Caption = 'Gobcut/MLD';
                }
                field(mouldQty; Rec."Mould Qty")
                {
                    Caption = 'Mould Qty';
                }
                field(blankQty; Rec."Blank Qty")
                {
                    Caption = 'Blank Qty';
                }
                field(blowMouldLifeExpected; Rec."Blow Mould Life (Expected)")
                {
                    Caption = 'Blow Mould Life (Expected)';
                }
                field(blankMouldLifeExpected; Rec."Blank Mould Life (Expected)")
                {
                    Caption = 'Blank Mould Life (Expected)';
                }
                field(manufacturer; Rec.Manufacturer)
                {
                    Caption = 'Manufacturer';
                }
                field(workCenter; Rec."Work Center")
                {
                    Caption = 'Work Center';
                }
                field(blankMouldLifeUsage; Rec."Blank Mould Life (Usage)")
                {
                    Caption = 'Blank Mould Life (Usage)';
                }
                field(blankMouldLifeBalance; Rec."Blank Mould Life (Balance)")
                {
                    Caption = 'Blank Mould Life (Balance)';
                }
                field(holderAssemblyNoMould; Rec."Holder Assembly No (Mould)")
                {
                    Caption = 'Holder Assembly No (Mould)';
                }
                field(holderAssemblyNoBlank; Rec."Holder Assembly No (Blank)")
                {
                    Caption = 'Holder Assembly No (Blank)';
                }
                field(invert; Rec.Invert)
                {
                    Caption = 'Invert';
                }
                field(blowMouldLifeUsagePerc; Rec."Blow Mould Life Usage %")
                {
                    Caption = 'Blow Mould Life Usage %';
                }
                field(blankMouldLifeUsagePerc; Rec."Blank Mould Life Usage %")
                {
                    Caption = 'Blank Mould Life Usage %';
                }
                field(currentWeightProduction; Rec."Current Weight Production")
                {
                    Caption = 'Current Weight Production';
                }
                field(weightGrowth; Rec."Weight Growth")
                {
                    Caption = 'Weight Growth';
                }
                field(weightCategory; Rec."Weight Category")
                {
                    Caption = 'Weight Category';
                }
                field(process; Rec.Process)
                {
                    Caption = 'Process';
                }
                field(mouldCategory; Rec."Mould Category")
                {
                    Caption = 'Mould Category';
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Blank Mould Life (Usage)","Blow Mould Life (Usage)");
    end;
}
