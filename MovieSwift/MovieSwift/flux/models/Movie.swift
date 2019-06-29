//
//  Movie.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 06/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation
import SwiftUI

struct Movie: Codable, Identifiable {
    //DMX one of the thing I don't like is to use a primitive type to represent identification.
    //I would prefer to create an ID struct, the ID struct could very well has only an int field
    //You could then have CastID, MovieID etc
    let id: Int
    let original_title: String
    let overview: String
    let poster_path: String?
    let backdrop_path: String?
    let popularity: Float
    let vote_average: Float
    let vote_count: Int
    let release_date: String
    
    let genres: [Genre]?
    let runtime: Int?
    let status: String?
    
    //DMX even Keywords, Images and productionCountry are defined in extension
    //    you could still start to use them in the main definition. You cannot
    //    define new property in extension
    var keywords: Keywords?
    var images: Images?
    var production_countries: [productionCountry]?
    
}

extension Movie {
    //Here, Keywords is defined as a struct, but don't forgot that Keyword itself is also
    //a struct. why we need a Keywords structure here? Nothing.
    struct Keywords: Codable {
        let keywords: [Keyword]?
    }
    
    struct Images: Codable {
        let posters: [MovieImage]?
        let backdrops: [MovieImage]?
    }
    
    struct productionCountry: Codable, Identifiable {
        let id = UUID()
        let name: String
    }
}

let sampleMovie = Movie(id: 0,
                        original_title: "Test movie",
                        overview: "Test desc",
                        poster_path: "/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg",
                        backdrop_path: "/nl79FQ8xWZkhL3rDr1v2RFFR6J0.jpg",
                        popularity: 50.5,
                        vote_average: 8.9,
                        vote_count: 1000,
                        release_date: "1972-03-14",
                        genres: [Genre(id: 0, name: "test")],
                        runtime: 80,
                        status: "released")
