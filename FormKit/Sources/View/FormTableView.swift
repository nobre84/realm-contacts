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
        setupHeights()
        registerCells()
        registerHeaderSectionViews()
        addFooterViewIfNeeded()
        isEditing = true
    }
    
    private func setupHeights() {
        estimatedRowHeight = 50
        sectionHeaderHeight = UITableView.automaticDimension
        estimatedSectionHeaderHeight = 40
    }
    
    private func registerCells() {
        registerFormFieldCell(FormLabelFieldCell.self)
        registerFormFieldCell(FormTextFieldCell.self)
        registerFormFieldCell(FormDateFieldCell.self)
    }
    
    private func registerHeaderSectionViews() {
        register(UINib(nibName: FormSectionHeaderView.nibName, bundle: Bundle(for: FormSectionHeaderView.self)), forHeaderFooterViewReuseIdentifier: FormSectionHeaderView.defaultReuseIdentifier)
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
        return sections[section].count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var field = sections[indexPath.section][indexPath.row]
        
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
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let formSection = sections[section]
        let view = dequeueReusableHeaderFooterView(withIdentifier: FormSectionHeaderView.defaultReuseIdentifier) as? FormSectionHeaderView
        view?.setup(with: formSection)
        
        return view
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        let formSection = sections[indexPath.section]
        return formSection.editingStyle == .delete
    }

    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        let formSection = sections[indexPath.section]
        return formSection.editingStyle
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let formSection = sections[indexPath.section]
        if editingStyle == .delete {
            formSection.removeField(at: indexPath.row)
            formSection.deleteHandler?(indexPath.row)

            beginUpdates()
            deleteRows(at: [indexPath], with: .automatic)
            if formSection.isShowingEmptyField {
                insertRows(at: [indexPath], with: .automatic)
            }
            endUpdates()
        }
    }
    
}

extension FormTableView: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let field = sections[indexPath.section][indexPath.row]
        
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
