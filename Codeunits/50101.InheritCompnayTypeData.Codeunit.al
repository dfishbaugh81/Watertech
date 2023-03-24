codeunit 50101 "InheritCompnayTypeData"

{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Table, Database::Contact, 'OnAfterValidateEvent', 'Company No.', true, true)]

    local procedure AssignIndustryType(var Rec: Record Contact)

    var
        ContactCompanyType: Record Contact;

    begin

        ContactCompanyType.Get(Rec."Company No.");

        Rec.ContactCompanyType := ContactCompanyType.ContactCompanyType;
    end;

}