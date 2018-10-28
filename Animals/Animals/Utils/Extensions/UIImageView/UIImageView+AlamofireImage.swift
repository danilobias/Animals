//
//  UIImageView+AlamofireImage.swift
//  Animals
//
//  Created by Danilo Bias Lago on 28/10/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIImageView {

    func load(urlString: String, placeholder: String) {
        let placeholderImage = UIImage(named: placeholder)!
        let url = URL(string: urlString)!
        self.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
}
