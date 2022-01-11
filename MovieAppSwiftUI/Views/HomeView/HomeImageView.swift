//
//  HomeImageView.swift
//  MovieAppSwiftUI
//
//  Created by Giovanna Moeller on 11/01/22.
//

import SwiftUI

struct HomeImageView: View {
  
  @EnvironmentObject var movieModel: MovieModel
  
  var body: some View {
    Image("spider-man")
      .resizable()
      .scaledToFill()
      .mask {
        LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .top, endPoint: .bottom)
      }.frame(minHeight: 456)
  }
}

struct HomeImageView_Previews: PreviewProvider {
  static var previews: some View {
    HomeImageView()
  }
}
