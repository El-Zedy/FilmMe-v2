//
//  NowplayingDetailsVC.swift
//  FilmMe
//
//  Created by Muhammad El Zedy on 9/24/19.
//  Copyright © 2019 ZozShark. All rights reserved.
//

import UIKit

class NowplayingDetailsVC: UIViewController {

    @IBOutlet weak var overviewNP: UITextView!
    @IBOutlet weak var popularityNP: UILabel!
    @IBOutlet weak var releasedateNP: UILabel!
    @IBOutlet weak var imageNP: UIImageView!
    @IBOutlet weak var titleNP: UILabel!
    var selectedItem: ResultNP!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleNP.text = selectedItem.title
        overviewNP.text = selectedItem.overview
        popularityNP.text = String(selectedItem.popularity)
        releasedateNP.text = selectedItem.releaseDate
        
        let posterPath = selectedItem.posterPath
        let baseUrl = "http://image.tmdb.org/t/p/w500"
        let imageUrl = URL(string: baseUrl + posterPath!)
        imageNP.setImageWith(imageUrl!)
        imageNP.layer.cornerRadius = 15
        imageNP.layer.masksToBounds = true

    }
    


}
