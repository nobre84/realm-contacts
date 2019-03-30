//
//  UIString+InitialsTests.swift
//  CT Rafael NobreTests
//
//  Created by Rafael Nobre on 25/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import XCTest
import Nimble
@testable import CT_Rafael_Nobre

class UIString_InitialsTests: XCTestCase {

    func testFirstNameHasOnlyOneInitial() {
        expect(String.initials(from: ["Rafael", nil])) == "R"
    }
    
    func testLastNameHasOnlyOneInitial() {
        expect(String.initials(from: [nil, "Nobre"])) == "N"
    }
    
    func testEmptyMiddleNameDoesNotAppearOnInitials() {
        expect(String.initials(from: ["Rafael", nil, "Rocha"])) == "RR"
    }
    
    func testEmptyStringBehavesTheSameAsNil() {
        expect(String.initials(from: ["Rafael", "", "Rocha"])) == "RR"
    }
    
    func testEmptyArrayGeneratesNoInitial() {
        expect(String.initials(from: [])) == ""
    }

    func testNilOnlyArrayGeneratesNoInitial() {
        expect(String.initials(from: [nil, "", nil])) == ""
    }
    
    func testMiddleNameIsIgnoredFromInitials() {
        expect(String.initials(from: ["Flávia", "de Souza", "Nobre"])) == "FN"
    }
    
    func testEmptyFirstNameIsIgnoredFromInitials() {
        expect(String.initials(from: ["", "Souza", "Nobre"])) == "SN"
    }
    
    func testLowercaseNamesAreUppercased() {
        expect(String.initials(from: ["flávia", "nobre"])) == "FN"
    }
}
