//
//  ContactFormTests.swift
//  CT Rafael NobreTests
//
//  Created by Rafael Nobre on 09/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import XCTest
import Nimble
import RealmSwift
@testable import CT_Rafael_Nobre
@testable import FormKit

class ContactFormTests: XCTestCase {
    
    private let contact: Contact = {
        let contact = Contact()
        contact.firstName = "Rafael"
        contact.lastName = "Nobre"
        contact.birthday = Date(timeIntervalSince1970: 0)
        let phones = List<PhoneNumber>()
        let phone = PhoneNumber()
        phone.label = "mobile"
        phone.number = "+5532988746640"
        phones.append(phone)
        contact.phoneNumbers = phones
        let addresses = List<Address>()
        let address = Address()
        address.label = "home"
        address.street = "Rua Dr. Acacio Teixeira"
        address.number = "153"
        address.city = "Juiz de Fora"
        address.state = "Minas Gerais"
        address.country = "Brazil"
        address.zipCode = "36052390"
        addresses.append(address)
        contact.addresses = addresses
        let emails = List<Email>()
        let email = Email()
        email.label = "personal"
        email.email = "nobre84@gmail.com"
        emails.append(email)
        contact.emails = emails
        contact.picture = UIImage.from(components: ["A","B"], size: CGSize(width: 100, height: 100))?.pngData()
        return contact
    }()

    func testFormShouldIdentifyModifications() {
        let contact = Contact()
        let form = ContactForm(presenter: nil, contact: contact, isUpdate: false)
        expect(form.isModified) == false
        form.contact.firstName = "John"
        expect(form.isModified) == true
    }
    
    func testFieldStatesShouldReflectInitialModel() {
        let form = ContactForm(presenter: nil, contact: contact, isUpdate: false)
        expect(form.firstNameField.text) == contact.firstName
        expect(form.lastNameField.text) == contact.lastName
        expect(form.birthdayField.date) == contact.birthday
        for i in 0..<form.phoneSection.count {
            expect((form.phoneSection[i] as! DualTextField).leftText) == contact.phoneNumbers[i].label
            expect((form.phoneSection[i] as! DualTextField).rightText) == contact.phoneNumbers[i].number
        }
        for i in 0..<form.addressesSection.count {
            expect((form.addressesSection[i] as! FormLookupField).label) == contact.addresses[i].label
            expect((form.addressesSection[i] as! FormLookupField).value?.text) == contact.addresses[i].text
        }
        for i in 0..<form.emailSection.count {
            expect((form.emailSection[i] as! DualTextField).leftText) == contact.emails[i].label
            expect((form.emailSection[i] as! DualTextField).rightText) == contact.emails[i].email
        }
        expect(form.profileField.picture?.pngData()) == form.contact.picture
    }
    
    func testFieldStateChangesShouldReflectInModel() {
        let form = AddressForm(presenter: nil, address: Address())
        form.labelField.text = "address.label"
        expect(form.address.label) == "address.label"
        form.streetField.text = "address.street"
        expect(form.address.street) == "address.street"
        form.numberField.text = "address.number"
        expect(form.address.number) == "address.number"
        form.cityField.text = "address.city"
        expect(form.address.city) == "address.city"
        form.stateField.text = "address.state"
        expect(form.address.state) == "address.state"
        form.countryField.text = "address.country"
        expect(form.address.country) == "address.country"
        form.zipField.text = "address.zipCode"
        expect(form.address.zipCode) == "address.zipCode"
    }

}
