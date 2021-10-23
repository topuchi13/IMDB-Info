//
//  MovieCell.swift
//  MovieCell
//
//  Created by Nika Topuria on 20.10.21.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    let imagePrefix = "https://image.tmdb.org/t/p/w500/"
    @IBOutlet var listImageView: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieScore: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieScore.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        movieTitle.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        listImageView.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func makeNew(_ movie: Movie) {
        listImageView.kf.setImage(with: URL(string: "\(imagePrefix)\(movie.listImage ?? "")"))
        movieTitle.text = movie.movieTitle
        movieScore.text = "\(String(movie.score))"
    }
}
