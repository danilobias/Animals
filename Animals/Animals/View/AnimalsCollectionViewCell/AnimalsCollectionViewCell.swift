//
//  AnimalsCollectionViewCell.swift
//  Animals
//
//  Created by Danilo Bias Lago on 26/10/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

class AnimalsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    
    // MARK: - Let's and VAR's
    let placeholderImage = UIImage(named: Constants.Placeholders.catImagePlaceholder)!
    
    // MARK: - Default
    override func prepareForReuse() {
        super.prepareForReuse()
        self.animalNameLabel.text = "-"
        self.animalImage.image = placeholderImage
        self.animalImage.contentMode = .center
    }
    
    // MARK: - Layout configs
    func configCellWith(cat: AnimalsResponse) {
        self.animalNameLabel.text = cat.id
        if let url = cat.url {
            self.animalImage.contentMode = .scaleAspectFit
            self.animalImage.load(urlString: url, placeholder: Constants.Placeholders.catImagePlaceholder)
        }
    }
}
