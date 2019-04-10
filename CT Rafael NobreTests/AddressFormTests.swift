//
//  AddressFormTests.swift
//  CT Rafael NobreTests
//
//  Created by Rafael Nobre on 09/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import XCTest
import Nimble
@testable import CT_Rafael_Nobre

class AddressFormTests: XCTestCase {

    func testFormShouldIdentifyModifications() {
        let address = Address()
        let form = AddressForm(presenter: nil, address: address)
        expect(form.isModified) == false
        form.address.city = "Dallas"
        expect(form.isModified) == true
    }
    
    func testFieldStatesShouldReflectInitialModel() {
        let address = Address()
        address.label = "home"
        address.street = "my street"
        address.number = "153"
        address.city = "my city"
        address.state = "my state"
        address.country = "my country"
        address.zipCode = "123456"
        
        let form = AddressForm(presenter: nil, address: address)
        expect(form.labelField.text) == address.label
        expect(form.streetField.text) == address.street
        expect(form.numberField.text) == address.number
        expect(form.cityField.text) == address.city
        expect(form.stateField.text) == address.state
        expect(form.countryField.text) == address.country
        expect(form.zipField.text) == address.zipCode
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
