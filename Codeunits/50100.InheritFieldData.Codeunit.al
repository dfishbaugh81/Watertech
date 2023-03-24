codeunit 50100 "InheritFieldData"

{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Table, Database::Contact, 'OnAfterValidateEvent', 'Company No.', true, true)]

    local procedure AssignIndustryType(var Rec: Record Contact)

    var
        ContactIndustryType: Record Contact;

    begin

        ContactIndustryType.Get(Rec."Company No.");

        Rec.Contact_industryType := ContactIndustryType.Contact_industryType;

    end;

}