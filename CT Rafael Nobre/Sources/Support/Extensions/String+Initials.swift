//
//  String+Initials.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 30/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

extension String {

    static func initials(from components: [String?]) -> String {
        let nonNilComponents = components.compactMap { $0 }
        let firstCharacters = nonNilComponents.compactMap { $0.first }
        let count = firstCharacters.count
        guard count > 0 else {
            return ""
        }
        var initials = String(firstCharacters[0]).uppercased()
        if count > 1 {
            initials += String(firstCharacters[count - 1]).uppercased()
        }
        return initials
    }

}
