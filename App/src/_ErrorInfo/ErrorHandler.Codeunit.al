codeunit 60000 "JPO Error Handler"
{
    Access = Internal;

    internal procedure HandleError(ErrorDetails: ErrorInfo)
    var
        Customer: Record Customer;
        CustomerNo: Text;
    begin
        CustomerNo := ErrorDetails.CustomDimensions.Get('CustomerNo');

        Customer.Reset();
        if Customer.Get(CustomerNo) then begin
            Customer.Validate("Privacy Blocked", true);
            Customer.Modify();
            Page.Run(Page::"Customer Card", Customer);
        end
        else
            Error('Customer not found');
    end;
}