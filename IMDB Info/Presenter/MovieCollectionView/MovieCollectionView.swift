//
//  MovieCollectionView.swift
//  IMDB Info
//
//  Created by Nika Topuria on 26.10.21.
//

import UIKit

class MovieCollectionView: UITableViewCell {
    
    @IBOutlet private weak var movieCollectionView: UICollectionView!
    var movies = [Movie]()
    var delegate: MovieCollectionViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        movieCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionViewCell")
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
    }
    
}

extension MovieCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "DetailsView", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailsView") as! DetailsView
        let _ = vc.view
        vc.makeView(movies[indexPath.row])
        delegate?.openSelection(this: vc)
    }
}

extension MovieCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.makeView(movies[indexPath.row])
        return cell
    }
    
}

protocol MovieCollectionViewDelegate {
    func openSelection(this vc: UIViewController)
}
