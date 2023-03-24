codeunit 50103 "Attachments"
{
    [EventSubscriber(ObjectType::Table, database::"Document Attachment", 'OnBeforeInsertAttachment', '', false, false)]
    local procedure OnBeforeInsertAttachment(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)

    var
        OpportunityVar: record Opportunity;
        ContactsVar: Record Contact;


    begin

        case RecRef.Number of
            DATABASE::Opportunity:
                begin
                    RecRef.SetTable(OpportunityVar);
                    DocumentAttachment.validate("No.", OpportunityVar."No.");
                end;
            DATABASE::Contact:
                begin
                    RecRef.SetTable(ContactsVar);
                    DocumentAttachment.validate("No.", ContactsVar."No.");

                end;

        end;

    end;



    [EventSubscriber(ObjectType::page, page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        OpportunityVar: record Opportunity;
        ContactsVar: Record Contact;

    begin

        case RecRef.Number of
            DATABASE::Opportunity:
                begin
                    RecRef.Open(DATABASE::Opportunity);
                    if OpportunityVar.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(OpportunityVar);
                end;
            DATABASE::Contact:
                begin
                    RecRef.Open(DATABASE::Contact);
                    if ContactsVar.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(ContactsVar);

                end;

        end;

    end;



    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure OnAfterOpenDorRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef; var FlowFieldsEditable: Boolean)
    var
        OpportunityVar: record Opportunity;
        ContactsVar: Record Contact;


    begin

        case RecRef.Number of
            DATABASE::Opportunity:
                begin
                    RecRef.SetTable(OpportunityVar);
                    DocumentAttachment.SetRange("No.", OpportunityVar."No.");
                end;
            DATABASE::Contact:
                begin
                    RecRef.SetTable(ContactsVar);
                    DocumentAttachment.SetRange("No.", ContactsVar."No.");

                end;

        end;

    end;


}