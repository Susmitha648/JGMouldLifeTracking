table 50150 "Mould Master"
{
    Caption = 'Mould Master';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "PO No."; Code[20])
        {
            Caption = 'PO No.';
        }
        field(2; "Mould Name"; Text[100])
        {
            Caption = 'Mould Name';
        }
        field(4; "Mould Size"; Text[100])
        {
            Caption = 'Mould Size';
        }
        field(5; "Glass Weight"; Decimal)
        {
            Caption = 'Glass Weight';
            trigger OnValidate()
            var
                MouldCategoryMatrix: Record "Mould Category Matrix";
            begin
                MouldCategoryMatrix.Reset();
                MouldCategoryMatrix.SetRange(Process, Rec.Process);
                MouldCategoryMatrix.SetFilter("Glass Weight From", '>=%1', "Glass Weight");
                MouldCategoryMatrix.SetFilter("Glass Weight To", '<=%1', "Glass Weight");
                If MouldCategoryMatrix.FindFirst() then begin
                    Validate("Gobcut/MLD", MouldCategoryMatrix."Gobcut/MLD");
                    "Mould Category" := MouldCategoryMatrix.Category;
                end;
            end;
        }
        field(7; "Received Date"; Date)
        {
            Caption = 'Received Date';
        }
        field(9; "Machine Center"; Code[20])
        {
            Caption = 'Machine Center';
            TableRelation = "Machine Center"."No.";
        }
        field(10; "Blow Mould Life (Usage)"; Decimal)
        {
            Caption = 'Blow Mould Life (Usage)';
            FieldClass = FlowField;
            DecimalPlaces = 0 : 5;
            Editable = false;
            CalcFormula = Sum("Mould Ledger Entries".Quantity where("PO No." = field("PO No."), Type = Const("Blow & Blow (BB)")));
        }
        field(11; "Blow Mould Life (Balance)"; Decimal)
        {
            Caption = 'Blow Mould Life (Balance)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            trigger OnValidate()
            begin
                CalcFields("Blow Mould Life (Usage)");
                "Blow Mould Life Usage %" := ("Blow Mould Life (Usage)" / "Blow Mould Life (Expected)") * 100;
            end;
        }
        field(12; "Mould Model"; Text[100])
        {
            Caption = 'Mould Model';
        }
        field(13; "Remarks"; Text[100])
        {
            Caption = 'Remarks';
        }
        field(14; "Gobcut/MLD"; Decimal)
        {
            Caption = 'Gobcut/MLD';
            DecimalPlaces = 0 : 2;
            Editable = false;
            trigger OnValidate()
            begin
                // If "Mould Qty" <> 0 then
                Validate("Blow Mould Life (Expected)", "Gobcut/MLD" * "Mould Qty");
                // If "Blank Qty" <> 0 then
                Validate("Blank Mould Life (Expected)", "Gobcut/MLD" * "Blank Qty");
            end;
        }
        field(15; "Mould Qty"; Decimal)
        {
            Caption = 'Mould Qty';
            trigger OnValidate()
            begin
                If "Gobcut/MLD" <> 0 then
                    Validate("Blow Mould Life (Expected)", "Gobcut/MLD" * "Mould Qty");
            end;
        }
        field(16; "Blank Qty"; Decimal)
        {
            Caption = 'Blank Qty';
            trigger OnValidate()
            begin
                If "Gobcut/MLD" <> 0 then
                    Validate("Blank Mould Life (Expected)", "Gobcut/MLD" * "Blank Qty");
            end;
        }
        field(17; "Blow Mould Life (Expected)"; Decimal)
        {
            Caption = 'Blow Mould Life (Expected)';
            Editable = false;
            trigger OnValidate()
            begin
                CalcFields("Blow Mould Life (Usage)");
                "Blow Mould Life Usage %" := ("Blow Mould Life (Usage)" / "Blow Mould Life (Expected)") * 100;
                "Blow Mould Life (Balance)" := "Blow Mould Life (Expected)" - "Blow Mould Life (Usage)";
            end;
        }
        field(18; "Blank Mould Life (Expected)"; Decimal)
        {
            Caption = 'Blank Mould Life (Expected)';
            Editable = false;
            trigger OnValidate()
            begin
                CalcFields("Blank Mould Life (Usage)");
                "Blank Mould Life Usage %" := ("Blank Mould Life (Usage)" / "Blank Mould Life (Expected)") * 100;
                "Blank Mould Life (Balance)" := "Blank Mould Life (Expected)" - "Blank Mould Life (Usage)";
            end;
        }
        field(19; "Manufacturer"; Text[100])
        {
            Caption = 'Manufacturer';
            TableRelation = Vendor.Name;
            ValidateTableRelation = false;
        }
        field(20; "Work Center"; Text[100])
        {
            Caption = 'Work Center';
            TableRelation = "Work Center".Name;
            ValidateTableRelation = false;
        }
        field(21; "Blank Mould Life (Usage)"; Decimal)
        {
            Caption = 'Blank Mould Life (Usage)';
            FieldClass = FlowField;
            DecimalPlaces = 0 : 5;
            Editable = false;
            CalcFormula = Sum("Mould Ledger Entries".Quantity where("PO No." = field("PO No."), Type = Const("Press & Blow (PB)")));
        }
        field(22; "Blank Mould Life (Balance)"; Decimal)
        {
            Caption = 'Blank Mould Life (Balance)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            trigger OnValidate()
            begin
                CalcFields("Blank Mould Life (Usage)");
                "Blank Mould Life Usage %" := ("Blank Mould Life (Usage)" / "Blank Mould Life (Expected)") * 100;
            end;
        }
        field(23; "Holder Assembly No (Mould)"; Decimal)
        {
            Caption = 'Holder Assembly No (Mould)';
        }
        field(24; "Holder Assembly No (Blank)"; Decimal)
        {
            Caption = 'Holder Assembly No (Blank)';
        }
        field(25; Invert; Decimal)
        {
            Caption = 'Invert';
        }
        field(26; "Blow Mould Life Usage %"; Decimal)
        {
            Caption = 'Blow Mould Life Usage %';
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(27; "Blank Mould Life Usage %"; Decimal)
        {
            Caption = 'Blank Mould Life Usage %';
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(28; "Current Weight Production"; Decimal)
        {
            Caption = 'Current Weight Production';
            DecimalPlaces = 0 : 2;
            trigger OnValidate()
            begin
                Validate("Weight Growth", "Current Weight Production" - "Glass Weight");
            end;
        }
        field(29; "Weight Growth"; Decimal)
        {
            Caption = 'Weight Growth';
            DecimalPlaces = 0 : 2;
            Editable = false;
            trigger OnValidate()
            begin
                If "Weight Growth" > 10 Then
                    "Weight Category" := "Weight Category"::"Above 10g"
                else if "Weight Growth" > 5 Then
                    "Weight Category" := "Weight Category"::"Above 5g"
                else If "Weight Growth" <= 5 Then
                    "Weight Category" := "Weight Category"::"Less than 5g";
            end;
        }
        field(30; "Weight Category"; Enum "Weight Category")
        {
            Caption = 'Weight Category';
            Editable = false;
        }
        field(31; "Process"; Enum Process)
        {
            Caption = 'Process';
            trigger OnValidate()
            var
                MouldCategoryMatrix: Record "Mould Category Matrix";
            begin
                MouldCategoryMatrix.Reset();
                MouldCategoryMatrix.SetRange(Process, Rec.Process);
                MouldCategoryMatrix.SetFilter("Glass Weight From", '<=%1', "Glass Weight");
                MouldCategoryMatrix.SetFilter("Glass Weight To", '>=%1', "Glass Weight");
                If MouldCategoryMatrix.FindFirst() then begin
                    Validate("Gobcut/MLD", MouldCategoryMatrix."Gobcut/MLD");
                    "Mould Category" := MouldCategoryMatrix.Category;
                end;
            end;
        }
        field(32; "Mould Category"; Enum "Mould Category")
        {
            Caption = 'Mould Category';
            Editable = false;
        }



    }
    keys
    {
        key(PK; "PO No.")
        {
            Clustered = true;
        }
    }
    trigger OnModify()
    begin
        If "Blank Mould Life (Expected)" <> 0 then begin
            CalcFields("Blank Mould Life (Usage)");
            "Blank Mould Life Usage %" := ("Blank Mould Life (Usage)" / "Blank Mould Life (Expected)") * 100;
            "Blank Mould Life (Balance)" := "Blank Mould Life (Expected)" - "Blank Mould Life (Usage)";
        end;
        If "Blow Mould Life (Expected)" <> 0 then begin
            CalcFields("Blow Mould Life (Usage)");
            "Blow Mould Life Usage %" := ("Blow Mould Life (Usage)" / "Blow Mould Life (Expected)") * 100;
            "Blow Mould Life (Balance)" := "Blow Mould Life (Expected)" - "Blow Mould Life (Usage)";
        end;
    end;
}
