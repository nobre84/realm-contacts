//
//  Object+DictionaryTests.swift
//  CT Rafael NobreTests
//
//  Created by Rafael Nobre on 05/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import XCTest
import Nimble
import RealmSwift
@testable import CT_Rafael_Nobre

class Object_DictionaryTests: XCTestCase {
    
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
        return contact
    }()
    
    func testContactConvertsToDictionary() {
        expect(self.contact.toDictionary() as NSDictionary) == [
                "addresses": [
                    ["city":"Juiz de Fora","country":"Brazil","label":"home","number":"153","state":"Minas Gerais","street":"Rua Dr. Acacio Teixeira","zipCode":"36052390"]
                ],
                "birthday":Date(timeIntervalSince1970: 0),
                "emails": [
                    ["email":"nobre84@gmail.com","label":"personal"]
                ],
                "firstName":"Rafael",
                "lastName":"Nobre",
                "phoneNumbers": [
                    ["label":"mobile","number":"+5532988746640"]
                ]
            ] as NSDictionary
    }
}
