codeunit 50200 "BSCL Subscriber Store"
{
    var
        BookOnBeforeDeleteErr: Label 'You are not allowed to delete %1 %2 because ist is liked by one or more Customer(s)';

    [EventSubscriber(ObjectType::Table, Database::"BSB Book", OnBeforeOnDelete, '', false, false)]
    local procedure "BSB Book_OnBeforeOnDelete"(var Rec: Record "BSB Book"; var xRec: Record "BSB Book"; var IsHandled: Boolean)
    var
        Customer: Record Customer;
    begin
        if IsHandled then
            exit;

        // Lösung mit der des FlowField
        // Rec.CalcFields("BSCL No. of Customer Likes"); //!Roundtrip zum SQL-Server
        // if Rec."BSCL No. of Customer Likes" > 0 then
        //     Error(BookOnBeforeDeleteErr,
        //         Rec.TableCaption,
        //         Rec."No.");

        // Lösung über den Customer --> Performanter als oben
        Customer.SetCurrentKey("BSB Favorite Book No."); // Mit erfahrenen Entwicklerkollegen besprechen, ob hier ein Key angelegt wird!
        Customer.SetRange("BSB Favorite Book No.", Rec."No.");
        if not Customer.IsEmpty then
            Error(BookOnBeforeDeleteErr,
                Rec.TableCaption,
                Rec."No.");

        IsHandled := true;
    end;
}