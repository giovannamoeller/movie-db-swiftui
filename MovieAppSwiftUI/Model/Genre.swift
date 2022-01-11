//
//  Genre.swift
//  MovieAppSwiftUI
//
//  Created by Giovanna Moeller on 11/01/22.
//

import Foundation

struct GenreData: Codable {
  var genres: [Genre]
}

struct Genre: Codable {
  var id: Int
  var name: String
}
