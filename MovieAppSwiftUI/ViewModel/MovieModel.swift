//
//  MovieModel.swift
//  MovieAppSwiftUI
//
//  Created by Giovanna Moeller on 10/01/22.
//

import Foundation
import Alamofire

class MovieModel: ObservableObject {
  
  @Published var movie = Movie(name: "", image: "", numberOfLikes: 0, popularity: 0, similarMovies: [])
  
  func getMovieDetails()  {
    let request = AF.request("https://api.themoviedb.org/3/movie/634649?api_key=8c36832f8b54bbc05c3041df2e3155d5&language=en-US&page=1rl")
    
    request.responseDecodable(of: Movie.self) { response in
      guard let movieResponse = response.value else { return }
      print(movieResponse)
      //self.movie = movieResponse
      //self.movie.setMovie(movie: movieResponse)
      self.movie = movieResponse
      print(self.movie)
    }
    //  return self.movie
  }
  
  func returnYearFromReleaseDate(similarMovie: SimilarMovie) -> String {
    let calendarDate = Calendar.current.dateComponents([.year], from: similarMovie.releaseDate)
    return String(calendarDate.year!)
  }
}
