//
//  NowPlayingVC.swift
//  FilmMe
//
//  Created by Muhammad El Zedy on 9/3/19.
//  Copyright © 2019 ZozShark. All rights reserved.
//

import UIKit

class NowPlayingVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var dataToPass: ResultNP!
    var nowplayingMoives: [ResultNP]?
    var nowplayingApi = NowplayingApi()

    @IBOutlet weak var collectionView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        nowplayingApi.getNPMovies { (response) in
            if let response = response{
                self.nowplayingMoives = response.results
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nowplayingMoives?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "npCell", for: indexPath) as? npCell{
            
            cell.npTitle.text = nowplayingMoives?[indexPath.item].title
            let posterPath = nowplayingMoives?[indexPath.item].posterPath
            let baseUrl = "http://image.tmdb.org/t/p/w500"
            let imageUrl = URL(string: baseUrl + posterPath!)
            cell.npImage.setImageWith(imageUrl!)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        let cellDimenssion = (width / 2) - 5
        return CGSize(width: cellDimenssion, height: cellDimenssion)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dataToPass = nowplayingMoives?[indexPath.item]
        performSegue(withIdentifier: "npdetils", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nowplayingVC  = segue.destination as? NowplayingDetailsVC{
            nowplayingVC.selectedItem = dataToPass
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        
        UIView.animate(withDuration: 0.75){
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1
            
        }
    }
}
