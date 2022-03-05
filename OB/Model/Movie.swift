//
//  Movie.swift
//  OB
//
//  Created by Consultant on 3/3/22.
//

import Foundation

struct Movie: Codable {
    let original_title:String
    let vote_average: Double
    let poster_path:String
    let overview:String
}


struct Raw: Codable {
    let page:Int
    let results:[Movie]
    let total_pages:Int
    let total_results:Int
}

