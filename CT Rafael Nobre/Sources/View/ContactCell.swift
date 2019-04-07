//
//  ContactCell.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 27/03/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import FormKit

class ContactCell: UITableViewCell, NibLoadableView {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with contact: Contact) {
        photoView.setRounded()
        var picture = UIImage.from(components: [contact.firstName, contact.lastName], size: photoView.frame.size)
        if let imageData = contact.picture, let image = UIImage(data: imageData) {
            picture = image
        }
        photoView.image = picture
        nameLabel.text = contact.fullName
    }

}
