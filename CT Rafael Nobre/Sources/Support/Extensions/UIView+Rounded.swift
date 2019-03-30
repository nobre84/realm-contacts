//
//  UIView+Rounded.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

extension UIView {

    func setRounded(radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? frame.width / 2
        self.layer.masksToBounds = true
    }
}
