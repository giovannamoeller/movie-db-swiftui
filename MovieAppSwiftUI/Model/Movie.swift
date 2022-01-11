//
//  Movie.swift
//  MovieAppSwiftUI
//
//  Created by Giovanna Moeller on 10/01/22.
//

import Foundation

// spider man ID movie from movieDB: 634649

struct Movie {
  var name: String
  var image: String
  var numberOfLikes: Int
  var popularity: Int
  var similarMovies: [SimilarMovie]
}
