//
//  FormTextFieldCell.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

class FormTextFieldCell: UITableViewCell, FormFieldCell {
    
    weak var field: FormTextField?
    static var nib: UINib { return UINib(resource: R.nib.formTextFieldCell) }
    static var identifier: String { return R.reuseIdentifier.formTextFieldCell.identifier }

    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var labelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        valueTextField.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
    }
    
    func setup(with field: FormField?) {
        self.field = field as? FormTextField
    }
    
    func updateUI() {
        labelLabel.text = field?.label
        valueTextField.text = field?.text
    }
    
    @objc private func valueChanged() {
        field?.text = valueTextField.text
        field?.valueChanged()
    }
    
}
