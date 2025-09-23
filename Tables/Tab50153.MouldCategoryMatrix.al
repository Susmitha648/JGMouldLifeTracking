table 50153 "Mould Category Matrix"
{
    Caption = 'Mould Category Matrix';
    DataClassification = CustomerContent;
    LookupPageId = "Mould Category Matrix";
    fields
    {
        field(1; Category; Enum "Mould Category")
        {
            Caption = 'Category';
        }
        field(2; "Gobcut/MLD"; Integer)
        {
            Caption = 'Gobcut/MLD';
        }
        field(3; "Glass Weight From"; Integer)
        {
            Caption = 'Glass Weight From';
        }
        field(4; "Glass Weight To"; Integer)
        {
            Caption = 'Glass Weight To';
        }
        field(5; Process; Enum Process)
        {
            Caption = 'Process';
        }
    }
    keys
    {
        key(PK; Category)
        {
            Clustered = true;
        }
    }
    fieldgroups{
        fieldgroup(Dropdown;Category,"Gobcut/MLD","Glass Weight From","Glass Weight To",Process){}
    }
}
