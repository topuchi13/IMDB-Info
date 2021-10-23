//
//  SearchConstructor.swift
//  SearchConstructor
//
//  Created by Nika Topuria on 22.10.21.
//

import Foundation

func SearchConstructor (with quary: String) -> String {
    let quaryPrefix = "https://api.themoviedb.org/3/search/movie?api_key=b688d2e3d40e21d185f1dd90d122a568&language=en-US&query="
    let quarySuffix = "&page=1&include_adult=false"
    let finalQuary = "\(quaryPrefix)\(quary)\(quarySuffix)"
    return finalQuary
}
