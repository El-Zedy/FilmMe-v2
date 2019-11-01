//
//  ViewController.swift
//  FilmMe
//
//  Created by Muhammad El Zedy on 9/2/19.
//  Copyright © 2019 ZozShark. All rights reserved.
//

import UIKit
import AFNetworking
import SVProgressHUD

class PopularVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   // var popularResults : Populars!
    var dataToPass: Result!
    var popularCell = PopularCell()
    var popularApi = PopularApi()
    
    var popularMovies: [Result] = []
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
    
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        spinner.startAnimating()
        popularApi.getPopularMovies { (response) in
            if let response = response{
                
                self.spinner.stopAnimating()
                self.popularMovies = response.results ?? []
                self.tableView.reloadData()
            }
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        animateTableView()
//    }
//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return popularMovies.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        if let cell = tableView.dequeueReusableCell(withIdentifier: "popularcell", for: indexPath) as? PopularCell {
            
            cell.popularTitle.text = popularMovies[indexPath.row].title
        
            let posterPath = popularMovies[indexPath.row].posterPath
            let baseUrl = "http://image.tmdb.org/t/p/w500"
            let imageUrl = URL(string: baseUrl + posterPath!)
            cell.popularImage.setImageWith(imageUrl!)
            return cell
        }
      return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataToPass = popularMovies[indexPath.row]
        performSegue(withIdentifier: "topopulardetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let popularDetailsVC  = segue.destination as? PopularDetailsVC{
            popularDetailsVC.selectedRow = dataToPass
        }
    }
    
//    func animateTableView(){
//
//        tableView.reloadData()
//        let cells = tableView.visibleCells
//
//        let tableViewHight = tableView.bounds.size.height
//
//        for cell in cells{
//            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHight)
//        }
//
//        var delayCounter = 0
//        for cell in cells {
//            UIView.animate(withDuration: 1.25, delay: Double(delayCounter) * 0.03, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
//                cell.transform = CGAffineTransform.identity
//            }, completion: nil)
//            delayCounter += 1
//        }
//    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //animation one
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        
        UIView.animate(withDuration: 0.75){
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1

        }
    }

}
