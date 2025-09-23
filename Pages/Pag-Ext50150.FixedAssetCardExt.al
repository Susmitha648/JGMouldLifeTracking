pageextension 50150 "Fixed Asset Card Ext" extends "Fixed Asset Card"
{

     layout
    {
        // Add changes to page layout here
        addafter("Insured")
        {
            field("Last Service Date"; Rec."Last Service Date")
            {
                ApplicationArea = All;
                ToolTip = 'Last Service Date';
            }
        }
    }
    actions
    {
        addafter("Maintenance &Registration")
        {
            action(PreventiveMaintenanceBOM)
            {
                Caption = 'Preventive Maintenance BOM';
                Promoted = true;
                PromotedCategory = Process;
                Image = List;
                ApplicationArea = All;
                RunObject = Page "Preventive Maintenance BOM";
                RunPageLink = "Asset No." = field("No.");
                
            }
        }
    }



}
