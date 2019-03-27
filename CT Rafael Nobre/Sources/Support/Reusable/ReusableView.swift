//
//  ReusableView.swift
//
//  Created by Rafael Nobre on 05/03/16.
//

import Foundation
import UIKit

// Concept: https://medium.com/@gonzalezreal/ios-cell-registration-reusing-with-swift-protocol-extensions-and-generics-c5ac4fb5b75e#.iflfe9b1e


protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}

extension UICollectionViewCell: ReusableView {
}

extension UITableViewCell: ReusableView {
}
