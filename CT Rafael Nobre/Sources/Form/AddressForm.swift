//
//  AddressForm.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 07/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import FormKit

class AddressForm {

    var address: Address
    
    var isModified: Bool {
        return address.toDictionary() as NSDictionary != originalAddress.toDictionary() as NSDictionary
    }
    
    private weak var presenter: UIViewController?
    private var originalAddress: Address
    
    lazy var sections: [FormSection] = {
        return [ mainSection ]
    }()
    
    // MARK: Sections
    
    private(set) lazy var mainSection: FormSection = {
        return FormSection(fields: [labelField, streetField, numberField, cityField, stateField, countryField, zipField])
    }()
    
    // MARK: Fields
    
    private(set) lazy var labelField: FormTextField = {
        let labelField = FormTextField(label: "Label", text: address.label, placeholder: "insert text")
        labelField.valueChangedHandler = { [weak self] newValue in
            self?.address.label = newValue
        }
        return labelField
    }()
    
    private(set) lazy var streetField: FormTextField = {
        let streetField = FormTextField(label: "Street", text: address.street, placeholder: "insert text")
        streetField.valueChangedHandler = { [weak self] newValue in
            self?.address.street = newValue
        }
        streetField.inputTraits = FormInputTraits(autocapitalizationType: .words)
        return streetField
    }()
    
    private(set) lazy var numberField: FormTextField = {
        let numberField = FormTextField(label: "Number", text: address.number, placeholder: "insert text")
        numberField.valueChangedHandler = { [weak self] newValue in
            self?.address.number = newValue
        }
        numberField.inputTraits = FormInputTraits(keyboardType: .numbersAndPunctuation)
        return numberField
    }()
    
    private(set) lazy var cityField: FormTextField = {
        let cityField = FormTextField(label: "City", text: address.city, placeholder: "insert text")
        cityField.valueChangedHandler = { [weak self] newValue in
            self?.address.city = newValue
        }
        cityField.inputTraits = FormInputTraits(autocapitalizationType: .words)
        return cityField
    }()
    
    private(set) lazy var stateField: FormTextField = {
        let stateField = FormTextField(label: "State", text: address.state, placeholder: "insert text")
        stateField.valueChangedHandler = { [weak self] newValue in
            self?.address.state = newValue
        }
        stateField.inputTraits = FormInputTraits(autocapitalizationType: .words)
        return stateField
    }()
    
    private(set) lazy var countryField: FormTextField = {
        let countryField = FormTextField(label: "Country", text: address.country, placeholder: "insert text")
        countryField.valueChangedHandler = { [weak self] newValue in
            self?.address.country = newValue
        }
        countryField.inputTraits = FormInputTraits(autocapitalizationType: .words)
        return countryField
    }()
    
    private(set) lazy var zipField: FormTextField = {
        let zipField = FormTextField(label: "Zip Code", text: address.zipCode, placeholder: "insert text")
        zipField.valueChangedHandler = { [weak self] newValue in
            self?.address.zipCode = newValue
        }
        zipField.inputTraits = FormInputTraits(keyboardType: .numberPad)
        return zipField
    }()
    
    init(presenter: UIViewController?, address: Address) {
        self.presenter = presenter
        self.address = address.detached()
        self.originalAddress = address.detached()
    }
    
}
