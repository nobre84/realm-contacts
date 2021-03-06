//
//  ContactFormController.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import FormKit
import RealmSwift

class ContactFormController: UIViewController {
    
    var form: ContactForm?
    var contact: Contact?

    @IBOutlet weak var formTableView: FormTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCustomCells()
        setupUI()
        setupForm()
    }
    
    private func setupUI() {
        title = contact == nil ? "New contact" : "Edit contact"
    }
    
    private func setupForm() {
        let form = ContactForm(presenter: self, contact: contact ?? Contact(), isUpdate: contact != nil)
        formTableView.sections = form.sections
        self.form = form
    }
    
    private func registerCustomCells() {
        formTableView.registerFormFieldCell(DualTextFieldCell.self)
        formTableView.registerFormFieldCell(ProfileFieldCell.self)
    }
    
    private func close() {
        performSegue(withIdentifier: R.segue.contactFormController.unwindToContactList, sender: nil)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        guard !(form?.isModified ?? false) else {
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            let discardAction = UIAlertAction(title: "Discard", style: .destructive) { [weak self] _ in
                self?.close()
            }
            return showConfirmation(title: "Confirmation", message: "Discard changes and close?", actions: [cancelAction, discardAction])
        }
        
        close()
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        do {
            try form?.save()
            close()
        }
        catch {
            showError(error)
        }
    }

}
