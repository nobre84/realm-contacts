//
//  AddressTests.swift
//  CT Rafael NobreTests
//
//  Created by Rafael Nobre on 09/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import XCTest
import Nimble
@testable import CT_Rafael_Nobre

class AddressTests: XCTestCase {

    func testAddressIsEmpty() {
        let address = Address()
        expect(address.isEmpty) == true
        
        address.label = "abc"
        expect(address.isEmpty) == false
        address.label = nil
        expect(address.isEmpty) == true
        
        address.street = "abc"
        expect(address.isEmpty) == false
        address.street = nil
        expect(address.isEmpty) == true
        
        address.number = "abc"
        expect(address.isEmpty) == false
        address.number = nil
        expect(address.isEmpty) == true
        
        address.city = "abc"
        expect(address.isEmpty) == false
        address.city = nil
        expect(address.isEmpty) == true
        
        address.state = "abc"
        expect(address.isEmpty) == false
        address.state = nil
        expect(address.isEmpty) == true
        
        address.country = "abc"
        expect(address.isEmpty) == false
        address.country = nil
        expect(address.isEmpty) == true
        
        address.zipCode = "abc"
        expect(address.isEmpty) == false
        address.zipCode = nil
        expect(address.isEmpty) == true
    }

}
