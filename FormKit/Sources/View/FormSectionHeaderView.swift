//
//  FormSectionHeaderView.swift
//  FormKit
//
//  Created by Rafael Nobre on 06/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

class FormSectionHeaderView: UITableViewHeaderFooterView, NibLoadableView, ReusableView {
    
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var sectionLabel: UILabel!

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        let bgView = UIView(frame: bounds)
//        bgView.backgroundColor = .groupTableViewBackground
//        backgroundView = bgView
//    }
    
    func setup(with section: FormSection) {        
        sectionLabel.text = section.title
        if stackView.arrangedSubviews.count == 2 {
            stackView.arrangedSubviews[1].removeFromSuperview()
        }
        if let button = section.button {
            stackView.addArrangedSubview(button)
        }
    }
    
}
