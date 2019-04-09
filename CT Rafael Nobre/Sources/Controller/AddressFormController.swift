//
//  AddressFormController.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 07/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import FormKit

class AddressFormController: UIViewController {

    var form: AddressForm?
    var address: Address?
    var backHandler: ((Address?) -> Void)?
    
    @IBOutlet private weak var formTableView: FormTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupForm()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if navigationController?.topViewController != self {
            backHandler?(form?.address)
        }
    }
    
    private func setupUI() {
        title = address == nil ? "New address" : "Edit address"
    }
    
    private func setupForm() {
        let form = AddressForm(presenter: self, address: address ?? Address())
        formTableView.sections = form.sections
        self.form = form
    }
    

}
