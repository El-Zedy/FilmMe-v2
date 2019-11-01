//
//  PopularDetailsVC.swift
//  FilmMe
//
//  Created by Muhammad El Zedy on 9/24/19.
//  Copyright © 2019 ZozShark. All rights reserved.
//

import UIKit

class PopularDetailsVC: UIViewController {

    
    @IBOutlet weak var overviewD: UITextView!
    @IBOutlet weak var releasedateD: UILabel!

    @IBOutlet weak var popularityD: UILabel!
    @IBOutlet weak var imageD: UIImageView!
    @IBOutlet weak var titleD: UILabel!
    var selectedRow: Result!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleD.text = selectedRow.title
        overviewD.text = selectedRow.overview
        let pop = String(selectedRow.popularity)
        popularityD.text = pop
        releasedateD.text = selectedRow.releaseDate
    
        let posterPath = selectedRow.posterPath
        let baseUrl = "http://image.tmdb.org/t/p/w500"
        let imageUrl = URL(string: baseUrl + posterPath!)
        imageD.setImageWith(imageUrl!)
        imageD.layer.cornerRadius = 15
        imageD.layer.masksToBounds = true

    }
    

}
