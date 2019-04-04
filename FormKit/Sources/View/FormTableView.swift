//
//  FormTableView.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding

public class FormTableView: TPKeyboardAvoidingTableView {

    public var sections = [FormSection]() {
        didSet {
            reloadData()
        }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    public func registerFormFieldCell(_ customCell: FormFieldCell.Type) {
        register(customCell.nib, forCellReuseIdentifier: customCell.identifier)
    }
    
    private func initialize() {
        delegate = self
        dataSource = self
        registerCells()
        addFooterViewIfNeeded()
    }
    
    private func registerCells() {
        registerFormFieldCell(FormLabelFieldCell.self)
        registerFormFieldCell(FormTextFieldCell.self)
        registerFormFieldCell(FormDateFieldCell.self)
    }

    private func addFooterViewIfNeeded() {
        if tableFooterView == nil {
            tableFooterView = UIView()
        }
    }
}

extension FormTableView: UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].fields.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var field = sections[indexPath.section].fields[indexPath.row]
        
        field.heightUpdateHandler = {
            tableView.reloadRows(at: [indexPath], with: .automatic)
            tableView.beginUpdates()
            tableView.endUpdates()
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: field).cellType.identifier, for: indexPath)
        
        if let formCell = cell as? FormFieldCell {
            formCell.setup(with: field)
        }
        
        return cell
    }
    
}

extension FormTableView: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let field = sections[indexPath.section].fields[indexPath.row]
        
        if let formCell = cell as? FormFieldCell {
            formCell.setup(with: field)
            formCell.updateUI()
        }
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let formCell = cell as? FormFieldCell {
            formCell.setup(with: nil)
        }
    }
    
}
