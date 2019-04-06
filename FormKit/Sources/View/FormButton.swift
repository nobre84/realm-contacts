//
//  FormButton.swift
//  FormKit
//
//  Created by Rafael Nobre on 06/04/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import UIKit

public class FormButton: UIButton {
    
    private var title: String?
    private var image: UIImage?
    private var action: () -> Void

    public convenience init(title: String, action: @escaping () -> Void) {
        self.init(title: title, image: nil, action: action)
    }
    
    public convenience init(image: UIImage, action: @escaping () -> Void) {
        self.init(title: nil, image: image, action: action)
    }
    
    init(title: String?, image: UIImage?, action: @escaping () -> Void) {
        self.title = title
        self.image = image
        self.action = action
        
        super.init(frame: .zero)
        
        setImage(image, for: .normal)
        setTitle(title, for: .normal)
        addTarget(self, action: #selector(handleAction), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleAction() {
        action()
    }

}
