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
    
    AF.request("url").response { response in
      print(response)
    }
  }
}

