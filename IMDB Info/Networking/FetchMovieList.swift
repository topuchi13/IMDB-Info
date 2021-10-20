//
//  FetchMovieList.swift
//  FetchMovieList
//
//  Created by Nika Topuria on 20.10.21.
//

import Foundation

class FetchMovieList {
    private let fetchURL = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=b688d2e3d40e21d185f1dd90d122a568&language=en-US&page=1")
    
    func fetchMovieList(completion: @escaping ((MovieList) -> Void)) {
        
        let session = URLSession.shared
        session.dataTask(with: fetchURL!) { Data, Response, Error in
            
            if let data = Data {
                do {
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
