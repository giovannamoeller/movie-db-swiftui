//
//  API.swift
//  MovieAppSwiftUI
//
//  Created by Giovanna Moeller on 10/01/22.
//

import Foundation
import Alamofire

struct API {
  static func makeRequest() {
    
    guard let path = Bundle.main.path(forResource: "keys", ofType: "plist") else { fatalError("API Key Path Not Found!")}
    let keys = NSDictionary(contentsOfFile: path)
    let APIKey = keys!["API_KEY"]!
    
    AF.request("https://api.themoviedb.org/3/movie/634649/similar?api_key=\(APIKey)&language=en-US&page=1rl").response { response in
      print(response)
    }
  }
}

