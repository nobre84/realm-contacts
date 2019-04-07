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

    weak var presenter: UIViewController?
    var address: Address
    private var originalAddress: Address
    
    var isModified: Bool {
        return address.toDictionary() as NSDictionary != address.toDictionary() as NSDictionary
    }
    
    lazy var sections: [FormSection] = {
        return [ mainSection ]
    }()
    
    // MARK: Sections
    
    lazy var mainSection: FormSection = {
        return FormSection(fields: [labelField, streetField, numberField, cityField])
    }()
    
    lazy var addressesSection: FormSection = {
        let addButton = FormButton(image: #imageLiteral(resourceName: "add_button")) {
            print("Add address tapped")
            //            let newField = FormLabelField(label: "novo", value: "234232434")
            //            self.addresses.append(newField)
            //            self.addressesSection.append(newField)
        }
        
        let emptyField = FormLabelField(label: "No phones added yet.", value: nil)
        let section = FormSection(title: "Addresses".uppercased(), button: addButton, isEditing: true,  emptyField: emptyField)
        return section
    }()
    
    // MARK: - Fields
    
    lazy var labelField: FormTextField = {
        let labelField = FormTextField(label: "Label", text: address.label, placeholder: "insert text")
        labelField.valueChangedHandler = { [weak self] newValue in
            self?.address.label = newValue
        }
        return labelField
    }()
    
    lazy var streetField: FormTextField = {
        let streetField = FormTextField(label: "Street", text: address.street, placeholder: "insert text")
        streetField.valueChangedHandler = { [weak self] newValue in
            self?.address.street = newValue
        }
        return streetField
    }()
    
    lazy var numberField: FormTextField = {
        let numberField = FormTextField(label: "Number", text: address.number, placeholder: "insert text")
        numberField.valueChangedHandler = { [weak self] newValue in
            self?.address.number = newValue
        }
        return numberField
    }()
    
    lazy var cityField: FormTextField = {
        let cityField = FormTextField(label: "City", text: address.city, placeholder: "insert text")
        cityField.valueChangedHandler = { [weak self] newValue in
            self?.address.city = newValue
        }
        return cityField
    }()
    
    lazy var stateField: FormTextField = {
        let stateField = FormTextField(label: "State", text: address.state, placeholder: "insert text")
        stateField.valueChangedHandler = { [weak self] newValue in
            self?.address.state = newValue
        }
        return stateField
    }()
    
    lazy var countryField: FormTextField = {
        let countryField = FormTextField(label: "Country", text: address.country, placeholder: "insert text")
        countryField.valueChangedHandler = { [weak self] newValue in
            self?.address.country = newValue
        }
        return countryField
    }()
    
    lazy var zipField: FormTextField = {
        let zipField = FormTextField(label: "Zip Code", text: address.zipCode, placeholder: "insert text")
        zipField.valueChangedHandler = { [weak self] newValue in
            self?.address.zipCode = newValue
        }
        return zipField
    }()
    
    init(presenter: UIViewController?, address: Address) {
        self.presenter = presenter
        self.address = address.detached()
        self.originalAddress = address.detached()
    }
    
}
