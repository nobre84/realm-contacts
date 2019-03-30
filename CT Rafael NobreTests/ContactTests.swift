//
//  ContactTests.swift
//  CT Rafael NobreTests
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import XCTest
import Nimble
@testable import CT_Rafael_Nobre

class ContactTests: XCTestCase {
    
    var contact = Contact()

    func testFullNameSimpleComponents() {
        contact.firstName = "Rafael"
        contact.lastName = "Nobre"
        expect(self.contact.fullName) == "Rafael Nobre"
    }
    
    func testFullNameMissingFirst() {
        contact.lastName = "Nobre"
        expect(self.contact.fullName) == "Nobre"
    }
    
    func testFullNameMissingLast() {
        contact.firstName = "Rafael"
        expect(self.contact.fullName) == "Rafael"
    }
    
    func testFullNameEmptyFirst() {
        contact.firstName = ""
        contact.lastName = "Nobre"
        expect(self.contact.fullName) == "Nobre"
    }
    
    func testFullNameEmptyLast() {
        contact.firstName = "Rafael"
        contact.lastName = ""
        expect(self.contact.fullName) == "Rafael"
    }
    
}
