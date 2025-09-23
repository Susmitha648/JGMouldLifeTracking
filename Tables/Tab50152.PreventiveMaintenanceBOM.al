table 50152 "Preventive Maintenance BOM"
{
    Caption = 'Preventive Maintenance BOM';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Asset No."; code[20])
        {
            Caption = 'Asset No.';
            NotBlank = true;
            TableRelation = "Fixed Asset";
            Editable = false;
        }
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            Editable = false;
        }
        
        field(3; "Item No."; code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item."No.";
        }
        field(4; "Description"; Text[200])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Asset No.","Entry No.")
        {
            Clustered = true;
        }
    }
}
