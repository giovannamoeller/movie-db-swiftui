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
    AF.request("url").response { response in
      print(response)
    }
  }
}

