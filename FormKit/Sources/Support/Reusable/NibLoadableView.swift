//
//  NibLoadableView.swift
//
//  Created by Rafael Nobre on 05/03/16.
//

import Foundation
import UIKit

// Concept: https://medium.com/@gonzalezreal/ios-cell-registration-reusing-with-swift-protocol-extensions-and-generics-c5ac4fb5b75e#.iflfe9b1e

public protocol NibLoadableView: class {
    static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}
