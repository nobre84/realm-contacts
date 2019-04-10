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
        
        leftTextField.addTarget(self, action: #selector(leftValueChanged), for: .editingChanged)
        rightTextField.addTarget(self, action: #selector(rightValueChanged), for: .editingChanged)
    }
    
    func setup(with field: FormField?) {
        self.field = field as? DualTextField
        self.field?.fieldUpdatedHandler = { [weak self] in
            self?.updateUI()
        }
    }
    
    func updateUI() {
        leftTextField.text = field?.leftText
        leftTextField.placeholder = field?.leftPlaceholder
        leftTextField.setTraits(field?.leftInputTraits)
        rightTextField.text = field?.rightText
        rightTextField.placeholder = field?.rightPlaceholder
        rightTextField.setTraits(field?.rightInputTraits)
    }
    
    @objc private func leftValueChanged() {
        field?.leftText = leftTextField.text
    }
    
    @objc private func rightValueChanged() {
        field?.rightText = rightTextField.text
    }
    
}
