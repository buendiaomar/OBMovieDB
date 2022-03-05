//
//  DetailViewController.swift
//  OB
//
//  Created by Consultant on 3/4/22.
//

import UIKit

class DetailViewController: UIViewController {
    var movie:Movie?
   
    @IBOutlet weak var overrideLabel: UILabel!
    @IBOutlet weak var average: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        
        average.text = "\(String(describing: movie?.vote_average))"
        overrideLabel.text = movie?.overview
        titleLabel.text = movie?.original_title
        let baseURL = "https://image.tmdb.org/t/p/original/" + ((movie!.poster_path) )
        let urlString = URL(string: baseURL)
        image.getImage(from: urlString!)
        
    }
}
    
    
    
    
 

 
