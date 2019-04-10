//
//  FormKitTests.swift
//  FormKitTests
//
//  Created by Rafael Nobre on 04/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import XCTest
import Nimble
@testable import FormKit

class FormKitTests: XCTestCase {

    func testTextFieldFiresValueChangedHandler() {
        var value: String?
        let field = FormTextField()
        field.textChangedHandler = { newValue in
            value = newValue
        }
        expect(value).to(beNil())
        field.text = "test"
        expect(value) == field.text
    }
    
    func testDateFieldFiresValueChangedHandler() {
        var value: Date?
        let field = FormDateField()
        field.valueChangedHandler = { newValue in
            value = newValue
        }
        expect(value).to(beNil())
        field.date = Date()
        expect(value) == field.date
    }
    
    func testLookupFieldFiresValueChangedHandler() {
        var value: LookupValue?
        let field = FormLookupField()
        field.valueChangedHandler = { newValue in
            value = newValue as? LookupValue
        }
        expect(value).to(beNil())
        field.value = LookupValue()
        expect(value) === field.value as? LookupValue
    }
    
}

class LookupValue: FormLookupFieldValue {
    public var text: String? { return "test" }
}
