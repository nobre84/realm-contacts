//
//  ContactDetailForm.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 02/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import FormKit
import RealmSwift

class ContactDetailForm {
    
    weak var presenter: UIViewController?
    var contact: Contact
    private var originalContact: Contact
    
    var isModified: Bool {
        return contact.toDictionary() as NSDictionary != originalContact.toDictionary() as NSDictionary
    }
    
    lazy var sections: [FormSection] = {
        return [ photoSection, infoSection, addressesSection, phoneSection, emailSection ]
    }()
    
    lazy var photoSection: FormSection = {
        return FormSection(title: "Profile".uppercased())
    }()
    
    lazy var infoSection: FormSection = {
        return FormSection(title: "Information".uppercased(), fields: [firstNameField, lastNameField, birthdayField])
    }()
    
    lazy var addressesSection: FormSection = {
        let addButton = FormButton(image: #imageLiteral(resourceName: "add_button")) {
            print("Add address tapped")
            let newField = FormLabelField(label: "novo", value: "234232434")
            self.addresses.append(newField)
            self.addressesSection.append(newField)
        }
        
        let emptyField = FormLabelField(label: "No phones added yet.", value: nil)
        let section = FormSection(title: "Addresses".uppercased(), fields: addresses, button: addButton, isEditing: true,  emptyField: emptyField)
        section.deleteHandler = { [weak self] index in
            print("Deleted index \(index)")
            self?.addresses.remove(at: index)
        }
        return section
    }()
    
    lazy var addresses: [FormLabelField] = {
        let fields = [ FormLabelField(label: "home", value: "555-3333"), FormLabelField(label: "mobile", value: "333-3333") ]
        return fields
    }()
    
    lazy var phoneSection: FormSection = {
        let addButton = FormButton(image: #imageLiteral(resourceName: "add_button")) { [weak self] in
            let newPhone = PhoneNumber()
            self?.contact.phoneNumbers.append(newPhone)
            self?.phoneSection.append(DualTextField(newPhone))
        }
        let emptyField = FormLabelField(label: "There are no phones.", value: nil)
        let section = FormSection(title: "Phones".uppercased(), fields: contact.phoneNumbers.map { DualTextField($0) } , button: addButton, isEditing: true, emptyField: emptyField)
        section.deleteHandler = { [weak self] index in
            self?.contact.phoneNumbers.remove(at: index)
        }
        return section
    }()
    
    lazy var emailSection: FormSection = {
        let addButton = FormButton(image: #imageLiteral(resourceName: "add_button")) {
            print("Add e-mail tapped")
        }
        return FormSection(title: "E-mails".uppercased(), button: addButton, isEditing: true)
    }()
    
    lazy var firstNameField: FormTextField = {
        let firstNameField = FormTextField(label: "First name", text: contact.firstName, placeholder: "insert text")
        firstNameField.valueChangedHandler = { [weak self] newValue in
            self?.contact.firstName = newValue
        }
        return firstNameField
    }()
    
    lazy var lastNameField: FormTextField = {
        let lastNameField = FormTextField(label: "Last name", text: contact.lastName, placeholder: "insert text")
        lastNameField.valueChangedHandler = { [weak self] newValue in
            self?.contact.lastName = newValue
        }
        return lastNameField
    }()
    
    lazy var birthdayField: FormDateField = {
        let birthdayField = FormDateField(label: "Birthday", date: contact.birthday, placeholder: "pick a date")
        birthdayField.valueChangedHandler = { [weak self] newValue in
            self?.contact.birthday = newValue
        }
        return birthdayField
    }()
    
    init(presenter: UIViewController?, contact: Contact) {
        self.presenter = presenter
        self.contact = Contact(value: contact)
        self.originalContact = Contact(value: contact)
    }
    
    func save() throws {
        let realm = try Realm()        
        try realm.write {
            realm.add(contact)
        }
    }
    
}
