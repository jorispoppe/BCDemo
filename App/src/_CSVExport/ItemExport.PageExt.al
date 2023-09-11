pageextension 60001 "JPO Item Export" extends "Item List"
{
    actions
    {
        addafter(CopyItem)
        {
            action("JPO Export CSV")
            {
                ApplicationArea = All;
                Caption = 'Export CSV';
                Image = Export1099;
                ToolTip = 'Export the items to CSV';

                trigger OnAction();
                begin
                    Xmlport.Run(XmlPort::"JPO Item Export", false, false);
                end;
            }
        }
        addfirst(Category_Process)
        {
            actionref("JPO Export CSV_Promoted"; "JPO Export CSV")
            {
            }
        }
    }
}