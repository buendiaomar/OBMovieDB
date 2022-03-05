//
//  APIEndpoints.swift
//  OB
//
//  Created by Omar Buendía on 3/3/22.
//

import Foundation
struct APIEndpoints {
    
    static let users = URL(string:
                            "https://jsonplaceholder.typicode.com/users")
    static let posts = URL(string:
                            "https://jsonplaceholder.typicode.com/posts")
    
    static let breweries = URL(string:
                                "https://api.openbrewerydb.org/breweries")
    
    static let movies = URL(string:
                                "https://api.themoviedb.org/3/movie/top_rated?api_key=e39a044c50038db38752a58b9be72dd1&1languaje=en-US&page=2")
                                
    
    
    
}
