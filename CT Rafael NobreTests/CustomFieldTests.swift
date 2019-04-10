//
//  CustomFieldTests.swift
//  CT Rafael NobreTests
//
//  Created by Rafael Nobre on 09/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import XCTest
import Nimble
@testable import CT_Rafael_Nobre
@testable import FormKit

class CustomFieldTests: XCTestCase {

    func testDualTextFieldFiresValueChangedHandler() {
        var leftValue: String?
        var rightValue: String?
        let field = DualTextField()
        field.textChangedHandler = { newLeftValue, newRightValue in
            leftValue = newLeftValue
            rightValue = newRightValue
        }
        expect(leftValue).to(beNil())
        expect(rightValue).to(beNil())
        field.leftText = "left"
        field.rightText = "right"
        expect(leftValue) == field.leftText
        expect(rightValue) == field.rightText
    }
    
    func testProfileFieldFiresValueChangedHandler() {
        var picture: UIImage?
        let field = ProfileField(nil, presenter: nil)
        field.valueChangedHandler = { newValue in
            guard let newValue = newValue else { return }
            picture = UIImage(data: newValue)
        }
        expect(picture).to(beNil())
        field.picture = UIImage.from(components: ["A","B"], size: CGSize(width: 100, height: 100))
        expect(picture?.pngData()) == field.picture?.pngData()
    }
    
    func testProfileFieldCellUpdatesAfterUpdates() {
        let field = ProfileField(presenter: nil)
        let cell = ProfileFieldCell.nib.instantiate(withOwner: nil, options: nil).first as! ProfileFieldCell
        cell.setup(with: field)
        cell.updateUI()
        
        guard let pictureImageView = cell.value(forKeyPath: "pictureImageView") as? UIImageView else { return fail("Couldn't find cell fields!") }
        
        let image = UIImage()
        expect(pictureImageView.image) != image
        field.picture = image
        expect(pictureImageView.image) == image
    }

}
