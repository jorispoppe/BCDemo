permissionset 60000 "JPO Demo Permissions"
{
    Access = Public;
    Assignable = true;
    Caption = 'Demo Permissions', MaxLength = 30;
    Permissions =
        codeunit "JPO Error Handler" = X,
        xmlport "JPO Item Export" = X;
}