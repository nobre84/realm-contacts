//
//  FormTextFieldCell.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

class FormTextFieldCell: UITableViewCell, FormFieldCell, NibLoadableView {
    
    weak var field: FormTextField?
    
    @IBOutlet private weak var valueTextField: UITextField!
    @IBOutlet private weak var labelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        valueTextField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
    
    func setup(with field: FormField?) {
        self.field = field as? FormTextField
    }
    
    func updateUI() {
        labelLabel.text = field?.label
        valueTextField.text = field?.text
        valueTextField.placeholder = field?.placeholder
        valueTextField.setTraits(field?.inputTraits)
    }
    
    @objc private func valueChanged() {
        field?.text = valueTextField.text
        field?.valueChanged()
    }
    
}
