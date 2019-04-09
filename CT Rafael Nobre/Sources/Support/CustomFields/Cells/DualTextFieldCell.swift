//
//  DualTextFieldCell.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 07/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import FormKit

class DualTextFieldCell: UITableViewCell, FormFieldCell, NibLoadableView {
    
    weak var field: DualTextField?
    
    @IBOutlet private weak var leftTextField: UITextField!
    @IBOutlet private weak var rightTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        leftTextField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
        rightTextField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
    
    func setup(with field: FormField?) {
        self.field = field as? DualTextField
    }
    
    func updateUI() {
        leftTextField.text = field?.leftText
        leftTextField.placeholder = field?.leftPlaceholder
        leftTextField.setTraits(field?.leftInputTraits)
        rightTextField.text = field?.rightText
        rightTextField.placeholder = field?.rightPlaceholder
        rightTextField.setTraits(field?.rightInputTraits)
    }
    
    @objc private func valueChanged() {
        field?.leftText = leftTextField.text
        field?.rightText = rightTextField.text
        field?.valueChanged()
    }
    
}
