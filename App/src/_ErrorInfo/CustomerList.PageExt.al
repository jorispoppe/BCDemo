/// <summary>
/// PageExtension JPO Customer List (ID 60000) extends Record Customer List.
/// </summary>
pageextension 60000 "JPO Customer List" extends "Customer List"
{
    actions
    {
        addfirst("&Customer")
        {
            action("JPO ErrorBC21")
            {
                ApplicationArea = All;
                Caption = 'Error BC 21';
                Image = ErrorLog;
                ToolTip = 'Error BC 21';

                trigger OnAction()
                var
                    errorDetails: ErrorInfo;
                begin
                    if (Rec."Privacy Blocked" = false) then begin
                        errorDetails.Message := 'Privacy is not blocked for this customer';
                        errorDetails.PageNo := Page::"Customer Card";
                        errorDetails.RecordId := Rec.RecordId;
                        Error(errorDetails);
                    end;
                end;
            }

            action("JPO ErrorBC22")
            {
                ApplicationArea = All;
                Caption = 'Error BC 22';
                Image = ErrorLog;
                ToolTip = 'Error BC 22';

                trigger OnAction()
                var
                    errorDetails: ErrorInfo;
                begin
                    if (Rec."Privacy Blocked" = false) then begin
                        errorDetails.Message := 'Privacy is not blocked for this customer';
                        errorDetails.PageNo := Page::"Customer Card";
                        errorDetails.RecordId := Rec.RecordId;
                        errorDetails.AddNavigationAction('Goto Customer Card');

                        errorDetails.CustomDimensions.Add('CustomerNo', Rec."No.");
                        errorDetails.AddAction('Block Privacy', Codeunit::"JPO Error Handler", 'HandleError');
                        Error(errorDetails);
                    end;
                end;
            }
        }
        addfirst(Category_Category7)
        {
            actionref("JPO ErrorBC21_Promoted"; "JPO ErrorBC21")
            {
            }
            actionref("JPO ErrorBC22_Promoted"; "JPO ErrorBC22")
            {
            }
        }
    }
}