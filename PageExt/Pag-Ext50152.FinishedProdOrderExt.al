pageextension 50152 "Finished Prod Order Ext" extends "Finished Production Order"
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
