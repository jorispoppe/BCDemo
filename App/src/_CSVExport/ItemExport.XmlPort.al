xmlport 60000 "JPO Item Export"
{
    Caption = 'Item Export';
    Direction = Export;
    FieldSeparator = ';';
    FileName = 'ItemExport.csv';
    Format = VariableText;
    TableSeparator = '<NewLine>';
    TextEncoding = UTF8;
    UseRequestPage = false;

    schema
    {
        textelement(Root)
        {
            tableelement(Integer; Integer)
            {
                SourceTableView = sorting(Number) where(Number = const(1));
                textelement(ItemNoTitle)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemNoTitle := Item.FieldCaption("No.");
                    end;
                }
                textelement(ItemUnitPriceTitle)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemUnitPriceTitle := Item.FieldCaption("Unit Price");
                    end;
                }
                textelement(ItemInventoryTitle)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemInventoryTitle := Item.FieldCaption(Inventory);
                    end;
                }
            }
            tableelement(Item; Item)
            {
                fieldelement(No; Item."No.")
                {
                }
                fieldelement(UnitPrice; Item."Unit Price")
                {
                }
                fieldelement(Inventory; Item.Inventory)
                {
                }
            }
        }
    }
}