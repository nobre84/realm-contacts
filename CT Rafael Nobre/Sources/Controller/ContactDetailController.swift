//
//  ContactDetailController.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import FormKit
import RealmSwift

class ContactDetailController: UIViewController {
    
    var form: ContactDetailForm?
    var contact: Contact?

    @IBOutlet weak var formTableView: FormTableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupForm()
        formTableView.registerFormFieldCell(DualTextFieldCell.self)
    }
    
    private func setupForm() {
        let form = ContactDetailForm(presenter: self, contact: contact ?? Contact(), isUpdate: contact != nil)
        formTableView.sections = form.sections
        self.form = form
    }
    
    private func close() {
        performSegue(withIdentifier: "unwindToContactList", sender: nil)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
