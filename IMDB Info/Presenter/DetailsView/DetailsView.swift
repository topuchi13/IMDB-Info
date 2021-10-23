//
//  DetailsView.swift
//  DetailsView
//
//  Created by Nika Topuria on 20.10.21.
//

import UIKit
import Kingfisher

class DetailsView: UIViewController {
    let imagePrefix = "https://image.tmdb.org/t/p/w500/"
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieScore: UILabel!
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var movieDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.alpha = 0.2
        // Do any additional setup after loading the view.
    }
    
    func makeView(_ movie: Movie) {
        mainImage.kf.setImage(with: URL(string: "\(imagePrefix)\(movie.largeImage ?? "")"))
        backgroundImage.kf.setImage(with: URL(string: "\(imagePrefix)\(movie.largeImage ?? "")"))
        movieTitle.text = movie.movieTitle
        movieScore.text = "IMDB Score: \(String(movie.score))"
        movieDescription.text = "Description: \(movie.overview)"
    }

    

}
