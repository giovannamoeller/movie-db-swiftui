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
    let getDetailsMovieRequest = API.makeRequest(request: .movieDetails)
    
    getDetailsMovieRequest.responseDecodable(of: Movie.self) { response in
      guard let data = response.value else { return }
      self.movie = data
    }
    
    let getGenres = API.makeRequest(request: .genres)
    var genres: [Genre] = []
    getGenres.responseDecodable(of: GenreData.self) { response in
      guard let data = response.value else { return }
      genres = data.genres
    }
    
    
    let getSimilariesMovies = API.makeRequest(request: .similarMovies)
    
    getSimilariesMovies.responseDecodable(of: SimilarMovieData.self) { response in
            
      guard let data = response.value else { return }
      
      for similarMovie in 0..<data.results.count {
        self.movie.similarMovies.append(data.results[similarMovie])
        
        let map: [String] = data.results[similarMovie].genresIds.map { id -> String in
          
          for genre in genres {
            if id == genre.id {
              return genre.name
            }
          }
          return ""
        }
        
        self.movie.similarMovies[similarMovie].genreString = map
      }
          
    }
  }
  
  func convertStringInDataFormatAndReturnYear(_ similarMovie: SimilarMovie) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy'-'MM'-'dd'"
    let date = dateFormatter.date(from: similarMovie.releaseDate)
    
    let calendarDate = Calendar.current.dateComponents([.year], from: date!)
    return String(calendarDate.year!)
  }
}
