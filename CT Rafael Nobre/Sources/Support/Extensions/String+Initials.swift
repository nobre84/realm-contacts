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
        return components.compactMap { $0 }.compactMap { $0.first }.map { String($0) }.joined()
    }

}
