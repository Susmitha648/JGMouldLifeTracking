report 50150 MouldGearLiftReport
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Layouts/MouldGearLiftReport.rdl';
    Caption = 'Mould Gear Lift Report';
    ApplicationArea = Suite;
    UsageCategory = Documents;
    WordMergeDataItem = "Mould Master";

    dataset
    {
        dataitem("Mould Master"; "Mould Master")
        {
            column(PO_No_; "PO No.")
            {
            }
            column(Manufacturer; "Manufacturer")
            {
            }
            column(Received_Date; Format("Received Date"))
            {
            }
            column(Glass_Weight; "Glass Weight")
            {
            }
            column(Mould_Qty; "Mould Qty")
            {
            }
            column(Blank_Qty; "Blank Qty")
            {
            }
            column(Gobcut_MLD; "Gobcut/MLD")
            {
            }
            column(Process; "Process")
            {
            }
            column(Mould_Category; "Mould Category")
            {
            }
            column(Blow_Mould_Life__Balance_; "Blow Mould Life (Balance)")
            {
            }
            column(Blank_Mould_Life__Balance_; "Blank Mould Life (Balance)")
            {
            }
            column(Blank_Mould_Life__Expected_; "Blank Mould Life (Expected)")
            {
            }
            column(Blow_Mould_Life__Expected_; "Blow Mould Life (Expected)")
            {
            }
            column(Blow_Mould_Life__Usage_; "Blow Mould Life (Usage)")
            {
            }
            column(Blank_Mould_Life__Usage_; "Blank Mould Life (Usage)")
            {
            }
            column(Holder_Assembly_No__Blank_; "Holder Assembly No (Blank)")
            {
            }
            column(Holder_Assembly_No__Mould_; "Holder Assembly No (Mould)")
            {
            }
            column(Invert; "Invert")
            {
            }
            column(Remarks; "Remarks")
            {
            }
            column(Blank_Mould_Life_Usage__; "Blank Mould Life Usage %")
            {
            }
            column(Blow_Mould_Life_Usage__; "Blow Mould Life Usage %")
            {
            }
            column(PurchaseHeader; "Job No.")
            {
            }
            dataitem("Mould Ledger Entries"; "Mould Ledger Entries")
            {
                DataItemLink = "PO No." = field("PO No.");
                DataItemLinkReference = "Mould Master";
                DataItemTableView = sorting("PO No.") where("Type" = filter("Press & Blow (PB)"));
                column(Machine_Center; "Machine Center")
                {
                }
                column(Posting_Date; Format("Posting Date"))
                {
                }
                column(DateOff; '')
                {
                }
                column(RunDays; '')
                {
                }
                column(Gobcut; '')
                {
                }
                column(BPM; '')
                {
                }
                column(Machine; "Machine Center")
                {
                }
                column(DateOn; Format("Posting Date"))
                {
                }
                column(DateOff_1; '')
                {
                }
                column(RunDays_1; '')
                {
                }
                column(Gobcut_1; '')
                {
                }
                column(RunforJob; "Production Order No.")
                {
                }
            }

        }
    }
}