//
//  FetchMovieList.swift
//  FetchMovieList
//
//  Created by Nika Topuria on 20.10.21.
//

import Foundation
import SwiftUI

class FetchMovieList {
    let testSearch = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=b688d2e3d40e21d185f1dd90d122a568&language=en-US&query=Dune&page=1&include_adult=false")
    func fetchMovieList(with url: String,completion: @escaping ((MovieList) -> Void)) {
        let quaryURL = URL(string: url)
        let session = URLSession.shared
        session.dataTask(with: quaryURL!) { Data, Response, Error in
            if let data = Data {
                do {
                    print (String(bytes: data, encoding: .utf8))
                    let movieList = try JSONDecoder().decode(MovieList.self, from: data)
                    completion(movieList)
                } catch {
                    if let error = Error {
                        print (error.localizedDescription)
                    }
                }
            } else {
                if let error = Error {
                    print (error.localizedDescription)
                }
            }
        }.resume()
    }
    
}
