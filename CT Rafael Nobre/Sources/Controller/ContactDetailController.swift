//
//  ContactDetailController.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

class ContactDetailController: UIViewController {
    
    var form: ContactDetailForm?

    @IBOutlet weak var formTableView: FormTableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupForm()
    }
    
    private func setupForm() {
        let form = ContactDetailForm(presenter: self, contact: Contact())
        formTableView.sections = form.sections
        self.form = form
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
