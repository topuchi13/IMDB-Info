//
//  SearchViewController..swift
//  SearchViewController.
//
//  Created by Nika Topuria on 22.10.21.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet private var searchBar: UISearchBar!
    @IBOutlet private weak var searchCollectionView: UICollectionView!
    private let fetch = FetchMovieList()
    private var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        searchCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionViewCell")
        // Do any additional setup after loading the view.
    }

}

extension SearchViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText
            let spacesFilteredText = text.replacingOccurrences(of: " ", with: "+")
            let searchQuary = SearchConstructor(with: spacesFilteredText)
            fetch.fetchMovieList(with: searchQuary) { movielist in
                self.movies = movielist.results
                
                DispatchQueue.main.async {
                    self.searchCollectionView.reloadData()
                }
            }
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            let spacesFilteredText = text.replacingOccurrences(of: " ", with: "+")
            let searchQuary = SearchConstructor(with: spacesFilteredText)
            fetch.fetchMovieList(with: searchQuary) { movielist in
                self.movies = movielist.results
                
                DispatchQueue.main.async {
                    self.searchCollectionView.reloadData()
                }
            }
        }
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "DetailsView", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailsView") as! DetailsView
        let _ = vc.view
        vc.makeView(movies[indexPath.row])
        self.present(vc, animated: true)
    }
}


extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.makeView(movies[indexPath.row])
        return cell
    }
    
}

