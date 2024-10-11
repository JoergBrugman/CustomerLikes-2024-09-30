codeunit 50201 "BSCL Book Type eBook Impl." implements "BSB Book Type Process"
{
    procedure StartDeployBook()
    begin
        Message('Bereitstellung des E-Book auf dem Kundenportal');
    end;

    procedure StartDeliverBook()
    begin
        Message('E-Mail mit Download-Link an Kunden senden');
    end;
}