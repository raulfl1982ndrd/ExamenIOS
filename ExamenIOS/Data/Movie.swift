//
//  Movie.swift
//  ExamenIOS
//
//  Created by Mañanas on 24/9/24.
//

struct MovieResponse: Codable{
    let totalResults: String
    let Search: [Movie]
    let Response: String
}

struct Movie: Codable {
    let Title: String
    let Year: String
    let Poster: String
    let imdbID: String
    let Plot : String?
    let Runtime : String?
    let Director : String?
    let Genre : String?
    let Country : String?
}
