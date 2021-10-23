//
//  FetchMovieList.swift
//  FetchMovieList
//
//  Created by Nika Topuria on 20.10.21.
//

import Foundation
import SwiftUI

class FetchMovieList {
    func fetchMovieList(with url: String,completion: @escaping ((MovieList) -> Void)) {
        let quaryURL = URL(string: url)
        let session = URLSession.shared
        if let url = quaryURL {
            session.dataTask(with: url) { Data, Response, Error in
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
}
