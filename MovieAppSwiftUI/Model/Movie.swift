//
//  Movie.swift
//  MovieAppSwiftUI
//
//  Created by Giovanna Moeller on 10/01/22.
//

import Foundation

// spider man ID movie from movieDB: 634649

struct Movie: Codable {
  var name: String
  var image: String
  var numberOfLikes: Int
  var popularity: Double
  var similarMovies: [SimilarMovie] = []
  
  enum CodingKeys: String, CodingKey {
    case name = "original_title"
    case image = "poster_path"
    case numberOfLikes = "vote_count"
    case popularity
  }
  
}
