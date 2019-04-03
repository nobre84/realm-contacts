//
//  ContactDetailForm.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 02/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

class ContactDetailForm {
    
    weak var presenter: UIViewController?
    var contact: Contact
    private var originalContact: Contact
    
    lazy var sections: [FormSection] = {
        return [ photoSection, infoSection, addressesSection, phoneSection, emailSection ]
    }()
    
    lazy var photoSection: FormSection = {
       return FormSection()
    }()
    
    lazy var infoSection: FormSection = {
        return FormSection([firstNameField, lastNameField])
    }()
    
    lazy var addressesSection: FormSection = {
        return FormSection()
    }()
    
    lazy var phoneSection: FormSection = {
        return FormSection()
    }()
    
    lazy var emailSection: FormSection = {
        return FormSection()
    }()
    
    lazy var firstNameField: FormTextField = {
        let firstNameField = FormTextField(label: "First name", text: "", placeholder: "type the first name")
        firstNameField.valueChangedHandler = { [weak self] newValue in
            self?.contact.firstName = newValue
        }
        return firstNameField
    }()
    
    lazy var lastNameField: FormTextField = {
        let lastNameField = FormTextField(label: "Last name", text: "", placeholder: "type the last name")
        lastNameField.valueChangedHandler = { [weak self] newValue in
            self?.contact.lastName = newValue
        }
        return firstNameField
    }()
    
    init(presenter: UIViewController?, contact: Contact) {
        self.presenter = presenter
        self.contact = Contact(value: contact)
        self.originalContact = Contact(value: contact)
    }
    
}
