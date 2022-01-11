//
//  MovieModel.swift
//  MovieAppSwiftUI
//
//  Created by Giovanna Moeller on 10/01/22.
//

import Foundation

class MovieModel: ObservableObject {
  
  var movie: Movie {
    getMovieDetails()
  }
  
  init() {
    
  }
  
  func getMovieDetails() -> Movie {
    let movie = Movie(name: "a", image: "a", numberOfLikes: 2, popularity: 3, similarMovies: [.init(name: "a", image: "a", releaseDate: Date(), genres: ["comedy", "a"])])
    return movie
    
  }
  
  func returnYearFromReleaseDate(similarMovie: SimilarMovie) -> String {
    let calendarDate = Calendar.current.dateComponents([.year], from: similarMovie.releaseDate)
    return String(calendarDate.year!)
  }
  
  
}
