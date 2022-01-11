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
    Image(systemName: "").data(url: URL(string: "\(API.imageURL)\(movieModel.movie.image)")!)
      .resizable()
      .scaledToFill()
      .clipped()
      .mask {
        LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .top, endPoint: .bottom)
      }.frame(maxHeight: 380)
  }
}

struct HomeImageView_Previews: PreviewProvider {
  static var previews: some View {
    HomeImageView()
  }
}
