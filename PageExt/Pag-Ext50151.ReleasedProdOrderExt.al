pageextension 50151 "Released Prod Order Ext" extends "Released Production Order"
{
    layout
    {
        addafter("Last Date Modified")
        {
            field("PO No."; Rec."PO No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
