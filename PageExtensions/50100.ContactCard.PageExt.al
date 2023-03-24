pageextension 50100 "ContactExPage" extends "Contact Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("Parental Consent Received")
        {
            field("Company Type"; rec.ContactCompanyType)
            {
                ApplicationArea = All;
                ShowMandatory = true;
            }

            field(Industry; rec.ContactIndustry)
            {
                ApplicationArea = All;
                ShowMandatory = true;
                Visible = false;
            }

            field(Contact_Latitude; Rec.ContactLatitude)
            {
                ApplicationArea = All;

            }

            field(Contact_Longitude; Rec.ContactLongitude)
            {
                ApplicationArea = All;
            }

            field(ContactSource; Rec.ContactSource)
            {
                ApplicationArea = All;
            }

            field("Contact_Do Not Solicit"; Rec."ContactDoNotSolicit")
            {
                ApplicationArea = All;
                Editable = EditableSetting;

            }

            field(ContactLeadScore; rec.ContactsLeadScore)
            {
                ApplicationArea = All;
            }

            field("Job Position"; rec."Job Position")
            {
                ApplicationArea = All;

            }

        }


        modify("E-Mail")
        {
            ApplicationArea = All;
            Editable = EditableSetting;
            ShowMandatory = true;
        }

        modify("No.")
        {
            ApplicationArea = all;
            trigger OnAfterValidate()
            var
                contactCompany: Record Contact;
            begin

                ContactFieldVisible();

            end;
        }



        modify(Type)
        {
            ApplicationArea = All;
            ShowMandatory = true;

            trigger OnAfterValidate()
            var
            begin

                ContactFieldVisible();

            end;

        }

        addafter("No.")
        {

            //Field was depreciated by Microsoft's update v19
            /*
            field("Job Title"; rec."Job Title")
            {
                Visible = true;
                ApplicationArea = All;
                Editable = EditableSetting;
            }
            */
        }
        // Modifies the Contact Card to show fields as required
        modify(Name)
        {
            Caption = 'Full Name /Company';
            ShowMandatory = true;
            ApplicationArea = All;

        }

        modify("Salesperson Code")
        {

            ShowMandatory = true;
            ApplicationArea = All;

        }

        modify("Organizational Level Code")
        {

            ShowMandatory = true;
            ApplicationArea = All;

        }


        modify("Home Page")
        {
            Caption = 'Website';

        }

        addafter(LastDateTimeModified)
        {
            field("Created On"; rec."Created On")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }

        addafter("Next Task Date")
        {

            field(Contact_industryType; rec.Contact_industryType)
            {
                ApplicationArea = All;
                ShowMandatory = true;

            }

        }

        addafter(Name)
        {
            field("First Name"; rec."First Name")
            {
                ApplicationArea = All;
                Editable = EditableSetting;
            }

            field(Surname; rec.Surname)
            {
                ApplicationArea = All;
                Editable = EditableSetting;

            }
        }


        addfirst(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(5050), "No." = field("No.");
            }



        }

        modify("Foreign Trade")
        {
            Visible = false;
        }






    }

    actions
    {
        // Adds a navigation option to show Contacts and Resources.
        addafter(History)
        {
            action("Show Competitors")
            {
                ApplicationArea = All;

                //Contacts/Competitor list
                RunObject = page CompetitorContactsList;
                RunPageLink = "Contact No." = field("No.");


            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var

    begin

        ContactFieldVisible();

    end;




    local procedure ContactFieldVisible()
    var
    begin


        case rec.Type of
            rec.Type::Company:
                begin
                    EditableSetting := false;

                end;

            rec.Type::Person:
                begin
                    EditableSetting := true;

                end;

        end;

    end;


    trigger OnNewRecord(BelowXrec: Boolean)
    var
        ContactCompany: Record Contact;

    begin

        ContactCompany.Get(Rec."Company No.");


        if rec."Company No." = ContactCompany."Company No." then begin

            Rec.ContactCompanyType := ContactCompany.ContactCompanyType;
            Rec.Contact_industryType := ContactCompany.Contact_industryType;

        end;


    end;




    var

        EditableSetting: Boolean;
}