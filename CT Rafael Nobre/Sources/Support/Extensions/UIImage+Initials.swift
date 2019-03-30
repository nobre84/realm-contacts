//
//  UIImage+Initials.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

extension UIImage {

    static func from(components: [String?], size: CGSize, textColor: UIColor = .white, bgColor: UIColor = Colors.sfRed) -> UIImage? {
        let renderLabel = UILabel()
        renderLabel.frame.size = size
        renderLabel.text = String.initials(from: components)
        renderLabel.textAlignment = .center
        renderLabel.textColor = textColor
        renderLabel.backgroundColor = bgColor
        renderLabel.layer.cornerRadius = size.width/2
        renderLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        
        UIGraphicsBeginImageContext(renderLabel.frame.size)
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        renderLabel.layer.render(in: context)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }

}
