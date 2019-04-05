//
//  UIViewController+Alerts.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 05/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showConfirmation(title: String? = nil, message: String? = nil, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        present(alert, animated: true)
    }
    
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "An error occurred", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in }))
        present(alert, animated: true)
    }
    
}
