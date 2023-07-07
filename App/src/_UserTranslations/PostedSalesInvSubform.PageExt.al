pageextension 60002 "JPO Posted Sales Inv. Subform" extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter(Description)
        {
            field("JPO User Description"; GetUserDescription(Rec))
            {
                ApplicationArea = All;
                Caption = 'Description';
                ToolTip = 'Specifies a description of the product that was sold.';
            }
        }
        addafter("Unit of Measure")
        {
            field("JPO User UnitOfMeasure"; GetUserUnitOfMeasure(Rec))
            {
                ApplicationArea = All;
                Caption = 'Unit of Measure';
                ToolTip = 'Specifies the name of the item or resource''s unit of measure, such as piece or hour.';
            }
        }
    }

    local procedure GetUserDescription(SalesInvoiceLine: Record "Sales Invoice Line"): Text
    var
        ItemTranslation: Record "Item Translation";
        Language: Codeunit Language;
    begin
        if (SalesInvoiceLine.Type <> "Sales Line Type"::Item) then
            exit(SalesInvoiceLine.Description);

        if (ItemTranslation.Get(SalesInvoiceLine."No.", SalesInvoiceLine."Variant Code", Language.GetUserLanguageCode())) then
            exit(ItemTranslation.Description);

        exit(SalesInvoiceLine.Description);
    end;

    local procedure GetUserUnitOfMeasure(SalesInvoiceLine: Record "Sales Invoice Line"): Text
    var
        UnitOfMeasureTranslation: Record "Unit of Measure Translation";
        Language: Codeunit Language;
    begin
        if (SalesInvoiceLine."Unit of Measure Code" = '') then
            exit(SalesInvoiceLine."Unit of Measure");

        if UnitOfMeasureTranslation.Get(SalesInvoiceLine."Unit of Measure Code", Language.GetUserLanguageCode()) then
            exit(UnitOfMeasureTranslation.Description);

        exit(SalesInvoiceLine."Unit of Measure");
    end;
}