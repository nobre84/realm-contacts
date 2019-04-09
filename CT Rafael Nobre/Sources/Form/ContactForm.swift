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
    
    var contact: Contact
    
    
    var isModified: Bool {
        return contact.toDictionary() as NSDictionary != originalContact.toDictionary() as NSDictionary
    }
    
    lazy var sections: [FormSection] = {
        return [ profileSection, addressesSection, phoneSection, emailSection ]
    }()
    
    private weak var presenter: UIViewController?
    private var originalContact: Contact
    private (set) var isUpdate: Bool
    
    // MARK: Sections
    
    private(set) lazy var profileSection: FormSection = {
        let section = FormSection(fields: [profileField, firstNameField, lastNameField, birthdayField])
        section.isHeaderHidden = true
        return section
    }()
    
    private(set) lazy var addressesSection: FormSection = {
        let addButton = FormButton(image: #imageLiteral(resourceName: "add_button")) { [weak self] in
            self?.showAddressForm()
        }
        
        let emptyField = FormEmptyField(text: "No addresses yet.")
        let section = FormSection(title: "Addresses".uppercased(), fields: contact.addresses.map { addressField(with: $0) } ,button: addButton, isEditing: true,  emptyField: emptyField)
        section.deleteHandler = { [weak self] index in
            self?.contact.addresses.remove(at: index)
        }
        return section
    }()
    
    private(set) lazy var phoneSection: FormSection = {
        let addButton = FormButton(image: #imageLiteral(resourceName: "add_button")) { [weak self] in
            let newPhone = PhoneNumber()
            self?.contact.phoneNumbers.append(newPhone)
            self?.phoneSection.append(DualTextField(newPhone))
        }
        let emptyField = FormEmptyField(text: "No phone numbers yet.")
        let section = FormSection(title: "Phones".uppercased(), fields: contact.phoneNumbers.map { DualTextField($0) } , button: addButton, isEditing: true, emptyField: emptyField)
        section.deleteHandler = { [weak self] index in
            self?.contact.phoneNumbers.remove(at: index)
        }
        return section
    }()
    
    private(set) lazy var emailSection: FormSection = {
        let addButton = FormButton(image: #imageLiteral(resourceName: "add_button")) { [weak self] in
            let newEmail = Email()
            self?.contact.emails.append(newEmail)
            self?.emailSection.append(DualTextField(newEmail))
        }
        let emptyField = FormEmptyField(text: "No e-mails yet.")
        let section = FormSection(title: "E-mails".uppercased(), fields: contact.emails.map { DualTextField($0) } , button: addButton, isEditing: true, emptyField: emptyField)
        section.deleteHandler = { [weak self] index in
            self?.contact.emails.remove(at: index)
        }
        return section
    }()
    
    // MARK: Fields
    
    private(set) lazy var profileField: ProfileField = {
        let profileField = ProfileField(contact.picture, presenter: self.presenter)
        profileField.valueChangedHandler = { [weak self] pictureData in
            self?.contact.picture = pictureData
        }
        return profileField
    }()
    
    private(set) lazy var firstNameField: FormTextField = {
        let firstNameField = FormTextField(label: "First name", text: contact.firstName, placeholder: "insert text")
        firstNameField.valueChangedHandler = { [weak self] newValue in
            self?.contact.firstName = newValue
        }
        firstNameField.inputTraits = FormInputTraits(autocapitalizationType: .words)
        return firstNameField
    }()
    
    private(set) lazy var lastNameField: FormTextField = {
        let lastNameField = FormTextField(label: "Last name", text: contact.lastName, placeholder: "insert text")
        lastNameField.valueChangedHandler = { [weak self] newValue in
            self?.contact.lastName = newValue
        }
        lastNameField.inputTraits = FormInputTraits(autocapitalizationType: .words)
        return lastNameField
    }()
    
    private(set) lazy var birthdayField: FormDateField = {
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
    
    private func addressField(with address: Address) -> FormLookupField {
        let field = FormLookupField(address)
        field.tappedHandler = { [weak self, weak field] in
            self?.showAddressForm(with: field?.value as? Address) { [weak field] newValue in
                field?.value = newValue
                field?.label = newValue.label
            }
        }
        return field
    }
    
    private func showAddressForm(with address: Address? = nil, completion: ((Address) -> Void)? = nil) {
        let isNew = address == nil
        let addressFormController = AddressFormController()
        addressFormController.address = address
        addressFormController.backHandler = { [weak self, weak addressFormController] address in
            guard let self = self,
                let address = address,
                let form = addressFormController?.form,
                form.isModified else { return }
            
            completion?(address)
            if isNew {
                self.contact.addresses.append(address)
                self.addressesSection.append(self.addressField(with: address))
            }
            else {
                guard let item = self.contact.addresses.first(where: { $0.id == address.id }),
                    let index = self.contact.addresses.index(of: item) else { return }
                self.contact.addresses.replace(index: index, object: address)
            }
            self.addressesSection.reload()
        }
        presenter?.show(addressFormController, sender: nil)
    }
    
}
