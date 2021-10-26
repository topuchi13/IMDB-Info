//
//  SearchViewController..swift
//  SearchViewController.
//
//  Created by Nika Topuria on 22.10.21.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet private var searchBar: UISearchBar!
    @IBOutlet private var searchTableView: UITableView!
    private let fetch = FetchMovieList()
    private var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchTableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
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
                    self.searchTableView.reloadData()
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
                    self.searchTableView.reloadData()
                }
            }
        }
    }
}



extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "DetailsView", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailsView") as! DetailsView
        let _ = vc.view
        vc.makeView(movies[indexPath.row])
        self.present(vc, animated: true)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.makeNew(movies[indexPath.row])
        return cell
    }
    
    
}
