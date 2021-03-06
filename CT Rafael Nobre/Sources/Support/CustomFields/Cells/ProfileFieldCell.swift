//
//  ProfileFieldCell.swift
//  CT Rafael Nobre
//
//  Created by Rafael Nobre on 07/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit
import FormKit

class ProfileFieldCell: UITableViewCell, FormFieldCell, NibLoadableView {

    weak var field: ProfileField?
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var pictureImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.setRounded()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        containerView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setup(with field: FormField?) {
        self.field = field as? ProfileField
        self.field?.fieldUpdatedHandler = { [weak self] in
            self?.updateUI()
        }
    }
    
    func updateUI() {
        if let picture = field?.picture {
            pictureImageView.image = picture
        }
    }
    
    @objc private func tapped() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        field?.presenter?.present(picker, animated: true)
    }
}

extension ProfileFieldCell: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        
        field?.picture = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
