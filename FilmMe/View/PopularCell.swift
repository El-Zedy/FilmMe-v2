//
//  PopularCell.swift
//  FilmMe
//
//  Created by Muhammad El Zedy on 9/16/19.
//  Copyright © 2019 ZozShark. All rights reserved.
//

import UIKit

class PopularCell: UITableViewCell {

    @IBOutlet weak var popularImage: UIImageView!
    @IBOutlet weak var popularTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        popularImage.layer.cornerRadius = 10

    }
   

}
