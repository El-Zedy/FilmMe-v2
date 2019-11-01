//
//  npCell.swift
//  FilmMe
//
//  Created by Muhammad El Zedy on 9/24/19.
//  Copyright © 2019 ZozShark. All rights reserved.
//

import UIKit

class npCell: UICollectionViewCell {
    
    @IBOutlet weak var npTitle: UILabel!
    @IBOutlet weak var npImage: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        npImage.layer.cornerRadius = 15
        npImage.layer.masksToBounds = true

    }
}
