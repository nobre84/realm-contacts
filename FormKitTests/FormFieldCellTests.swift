//
//  FormFieldCellTests.swift
//  FormKitTests
//
//  Created by Rafael Nobre on 09/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import XCTest
import Nimble
@testable import FormKit

class FormFieldCellTests: XCTestCase {

    func testLabelFieldCellUpdatesAfterUpdates() {
        let field = FormLabelField()
        let cell = cellForType(FormLabelFieldCell.self)
        cell.setup(with: field)
        cell.updateUI()
        
        guard let valueLabel = cell.value(forKeyPath: "valueLabel") as? UILabel,
            let labelLabel = cell.value(forKeyPath: "labelLabel") as? UILabel else { return fail("Couldn't find cell fields!") }
        
        expect(labelLabel.text) == ""
        field.label = "test"
        expect(labelLabel.text) == "test"
        
        expect(valueLabel.text) == ""
        field.value = "test"
        expect(valueLabel.text) == "test"
    }
    
    func testTextFieldCellUpdatesAfterUpdates() {
        let field = FormTextField()
        let cell = cellForType(FormTextFieldCell.self)
        cell.setup(with: field)
        cell.updateUI()
        
        guard let valueTextField = cell.value(forKeyPath: "valueTextField") as? UITextField,
            let labelLabel = cell.value(forKeyPath: "labelLabel") as? UILabel else { return fail("Couldn't find cell fields!") }
        
        expect(valueTextField.text) == ""
        field.text = "test"
        expect(valueTextField.text) == "test"
        
        expect(labelLabel.text) == ""
        field.label = "test"
        expect(labelLabel.text) == "test"
    }
    
    func testDateFieldCellUpdatesAfterUpdates() {
        let field = FormDateField()
        let cell = cellForType(FormDateFieldCell.self)
        cell.setup(with: field)
        cell.updateUI()
        
        guard let datePicker = cell.value(forKeyPath: "datePicker") as? UIDatePicker,
            let labelLabel = cell.value(forKeyPath: "labelLabel") as? UILabel else { return fail("Couldn't find cell fields!") }
        
        let oldDate = datePicker.date
        let theSeventies = Date(timeIntervalSince1970: 0)
        expect(datePicker.date) == oldDate
        field.date = theSeventies
        expect(datePicker.date) == theSeventies
        
        expect(labelLabel.text) == ""
        field.label = "test"
        expect(labelLabel.text) == "test"
    }
    
    func testEmptyFieldCellUpdatesAfterUpdates() {
        let field = FormEmptyField()
        let cell = cellForType(FormEmptyFieldCell.self)
        cell.setup(with: field)
        cell.updateUI()
        
        guard let emptyLabel = cell.value(forKeyPath: "emptyLabel") as? UILabel else { return fail("Couldn't find cell fields!") }
        
        expect(emptyLabel.text) == ""
        field.text = "test"
        expect(emptyLabel.text) == "test"
    }
    
    func testLookupFieldCellUpdatesAfterUpdates() {
        let field = FormLookupField()
        let cell = cellForType(FormLookupFieldCell.self)
        cell.setup(with: field)
        cell.updateUI()
        
        guard let valueLabel = cell.value(forKeyPath: "valueLabel") as? UILabel,
            let labelLabel = cell.value(forKeyPath: "labelLabel") as? UILabel else { return fail("Couldn't find cell fields!") }
        
        expect(labelLabel.text) == ""
        field.label = "test"
        expect(labelLabel.text) == "test"
        
        let value = LookupValue()
        
        expect(valueLabel.text) == ""
        field.value = value
        expect(valueLabel.text) == value.text
    }
    
    private func cellForType<T: FormFieldCell & NibLoadableView>(_ type: T.Type) -> T {
        return type.nib.instantiate(withOwner: nil, options: nil).first as! T
    }

}
