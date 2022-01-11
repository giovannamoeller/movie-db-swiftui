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
      guard let movieResponse = response.value else { return }
      self.movie = movieResponse
    }
    
    let getSimilariesMovies = API.makeRequest(request: .similarMovies)
    
    getSimilariesMovies.responseDecodable(of: SimilarMovieData.self) { response in
            
      guard let data = response.value else { return }
      
      for similarMovie in data.results {
        self.movie.similarMovies.append(similarMovie)
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
