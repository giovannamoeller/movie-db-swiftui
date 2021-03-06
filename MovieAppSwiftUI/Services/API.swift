//
//  API.swift
//  MovieAppSwiftUI
//
//  Created by Giovanna Moeller on 10/01/22.
//

import Foundation
import Alamofire

enum RequestCallsAPI {
  case movieDetails, similarMovies, genres
}

struct API {
  static let imageURL = "https://image.tmdb.org/t/p/original/"
  
  static func makeRequest(request: RequestCallsAPI) -> DataRequest {
    
    var AFRequest: DataRequest
        
    guard let path = Bundle.main.path(forResource: "keys", ofType: "plist") else { fatalError("API Key Path Not Found!")}
    let keys = NSDictionary(contentsOfFile: path)
    let APIKey = keys!["API_KEY"]!
    
    switch request {
      case .movieDetails:
      AFRequest = AF.request("https://api.themoviedb.org/3/movie/634649?api_key=\(APIKey)&language=en-US&page=1rl")
      
      case .similarMovies:
      AFRequest = AF.request("https://api.themoviedb.org/3/movie/634649/similar?api_key=\(APIKey)&language=en-US&page=1")
      
      case .genres:
      AFRequest = AF.request("https://api.themoviedb.org/3/genre/movie/list?api_key=\(APIKey)&language=en-US/genres")
      
    }
    
    return AFRequest
    
  }
}

