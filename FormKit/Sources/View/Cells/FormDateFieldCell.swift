//
//  FormDateFieldCell.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 04/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

class FormDateFieldCell: UITableViewCell, FormFieldCell, NibLoadableView {
    
    weak var field: FormDateField?
    
    private static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeZone = .none
        return formatter
    }()
    
    @IBOutlet private weak var labelLabel: UILabel!
    @IBOutlet private weak var valueTextField: UITextField!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var topStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        datePicker.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        datePicker.isHidden = true
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        topStackView.addGestureRecognizer(tapRecognizer)
    }
    
    func setup(with field: FormField?) {
        self.field = field as? FormDateField
    }
    
    func updateUI() {
        guard let field = field else { return }
        
        labelLabel.text = field.label
        valueTextField.text = format(date: field.date)
        valueTextField.placeholder = field.placeholder
        datePicker.date = field.date ?? Date()
        datePicker.isHidden = !field.isEditingDate
    }
    
    @objc private func valueChanged() {
        field?.date = datePicker.date
        valueTextField.text = format(date: field?.date)
        field?.valueChanged()
    }
    
    @objc private func cellTapped() {
        guard let field = field else { return }
        
        window?.endEditing(true)
        
        let isHidden = !field.isEditingDate
        field.isEditingDate = isHidden
        datePicker.isHidden = isHidden
        
        valueChanged()
        field.heightUpdateHandler?()
    }
    
    private func format(date: Date?) -> String? {
        guard let date = date else { return nil }
        
        return FormDateFieldCell.formatter.string(from: date)
    }
    
}
