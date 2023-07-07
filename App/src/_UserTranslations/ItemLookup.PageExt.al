pageextension 60003 "JPO Item Lookup" extends "Item Lookup"
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
    }

    local procedure GetUserDescription(Item: Record Item): Text
    var
        ItemTranslation: Record "Item Translation";
        Language: Codeunit Language;
    begin
        if (ItemTranslation.Get(Item."No.", '', Language.GetUserLanguageCode())) then
            exit(ItemTranslation.Description);

        exit(Item.Description);
    end;
}