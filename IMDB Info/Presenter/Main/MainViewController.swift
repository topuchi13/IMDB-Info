//
//  ViewController.swift
//  IMDB Info
//
//  Created by Nika Topuria on 20.10.21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    let fetch = FetchMovieList()
    var movies = [Movie]()
    
    override func viewDidLoad() {
        fetch.fetchMovieList { movielist in
            self.movies = movielist.results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }
}


extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "DetailsView", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailsView") as! DetailsView
        let _ = vc.view
        vc.makeView(movies[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.makeNew(movies[indexPath.row])
        return cell
    }
    
    
}
