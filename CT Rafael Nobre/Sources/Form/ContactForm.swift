//
//  ContactForm.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 02/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import FormKit
import RealmSwift

class ContactForm {
    
    weak var presenter: UIViewController?
    var contact: Contact
    private var originalContact: Contact
    private (set) var isUpdate: Bool
    
    var isModified: Bool {
        return contact.toDictionary() as NSDictionary != originalContact.toDictionary() as NSDictionary
    }
    
    lazy var sections: [FormSection] = {
        return [ profileSection, addressesSection, phoneSection, emailSection ]
    }()
    
    // MARK: Sections
    
    lazy var profileSection: FormSection = {
        return FormSection(title: "Profile".uppercased(), fields: [profileField, firstNameField, lastNameField, birthdayField])
    }()
    
    lazy var addressesSection: FormSection = {
        let addButton = FormButton(image: #imageLiteral(resourceName: "add_button")) { [weak self] in
            self?.showAddressForm()
        }
        
        let emptyField = FormLabelField(label: "No addresses yet.")
        let section = FormSection(title: "Addresses".uppercased(), button: addButton, isEditing: true,  emptyField: emptyField)
        return section
    }()
    
    lazy var phoneSection: FormSection = {
        let addButton = FormButton(image: #imageLiteral(resourceName: "add_button")) { [weak self] in
            let newPhone = PhoneNumber()
            self?.contact.phoneNumbers.append(newPhone)
            self?.phoneSection.append(DualTextField(newPhone))
        }
        let emptyField = FormLabelField(label: "No phone numbers yet.")
        let section = FormSection(title: "Phones".uppercased(), fields: contact.phoneNumbers.map { DualTextField($0) } , button: addButton, isEditing: true, emptyField: emptyField)
        section.deleteHandler = { [weak self] index in
            self?.contact.phoneNumbers.remove(at: index)
        }
        return section
    }()
    
    lazy var emailSection: FormSection = {
        let addButton = FormButton(image: #imageLiteral(resourceName: "add_button")) { [weak self] in
            let newEmail = Email()
            self?.contact.emails.append(newEmail)
            self?.emailSection.append(DualTextField(newEmail))
        }
        let emptyField = FormLabelField(label: "No e-mails yet.")
        let section = FormSection(title: "E-mails".uppercased(), fields: contact.emails.map { DualTextField($0) } , button: addButton, isEditing: true, emptyField: emptyField)
        section.deleteHandler = { [weak self] index in
            self?.contact.emails.remove(at: index)
        }
        return section
    }()
    
    // MARK: - Fields
    
    lazy var profileField: ProfileField = {
        let profileField = ProfileField(contact.picture, presenter: self.presenter)
        profileField.valueChangedHandler = { [weak self] pictureData in
            self?.contact.picture = pictureData
        }
        return profileField
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
    
    init(presenter: UIViewController?, contact: Contact, isUpdate: Bool) {
        self.presenter = presenter
        self.contact = contact.detached()
        self.originalContact = contact.detached()
        self.isUpdate = isUpdate
    }
    
    func save() throws {
        let realm = try Realm()        
        try realm.write {
            realm.add(contact, update: isUpdate)
        }
    }
    
    private func showAddressForm(with address: Address? = nil) {
        let isUpdate = address != nil
        let addressFormController = AddressFormController()
        addressFormController.address = address
        addressFormController.backHandler = { [weak self] address in
            guard let address = address else { return }
            if !isUpdate {
                self?.contact.addresses.append(address)
            }
            else {
                //TODO update
//                self?.contact.addresses[]
            }
        }
        presenter?.show(addressFormController, sender: nil)
    }
    
}
