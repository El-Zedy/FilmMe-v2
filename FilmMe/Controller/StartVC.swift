//
//  StartVC.swift
//  FilmMe
//
//  Created by Muhammad El Zedy on 9/28/19.
//  Copyright © 2019 ZozShark. All rights reserved.
//

import UIKit

class StartVC: UIViewController {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var findLAbel: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var deskLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.alpha = 0
        bgImage.alpha = 0
        deskLabel.alpha = 0
        playBtn.alpha = 0
        findLAbel.alpha = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 1, animations: {
            self.bgImage.alpha = 0.7
        }) { (true) in
            self.showtitle()
        }
    }
    
    func showtitle(){
        
        UIView.animate(withDuration: 1, animations: {
            self.titleLabel.alpha = 1
        }, completion: { (true) in
            self.showDescription()
        })
    }
    
    func showDescription(){
        
        UIView.animate(withDuration: 1, animations: {
            self.deskLabel.alpha = 1
        }) { (true) in
            self.showBtnAndText()
        }
    }
    
    func showBtnAndText(){
        UIView.animate(withDuration: 1) {
            self.playBtn.alpha = 1
            self.findLAbel.alpha = 1
            self.bgImage.alpha = 1
            
        }
    }
    
}

