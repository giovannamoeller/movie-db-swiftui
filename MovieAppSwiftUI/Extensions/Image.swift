//
//  Image.swift
//  MovieAppSwiftUI
//
//  Created by Giovanna Moeller on 11/01/22.
//

import Foundation
import UIKit
import SwiftUI

extension Image {
  func data(url: URL) -> Self {
    if let data = try? Data(contentsOf: url) {
      return Image(uiImage: UIImage(data: data)!)
        .resizable()
    }
    return self.resizable()
  }
}
