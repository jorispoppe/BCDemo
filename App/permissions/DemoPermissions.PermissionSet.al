/// <summary>
/// Unknown JPO Demo Permissions (ID 60000).
/// </summary>
permissionset 60000 "JPO Demo Permissions"
{
    Assignable = true;
    Caption = 'Demo Permissions', MaxLength = 30;
    Permissions =
        codeunit "JPO Error Handler" = X;
}