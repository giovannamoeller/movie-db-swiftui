//
//  HomeSimilarMoviesView.swift
//  MovieAppSwiftUI
//
//  Created by Giovanna Moeller on 11/01/22.
//

import SwiftUI

struct HomeSimilarMoviesView: View {
  @EnvironmentObject var movieModel: MovieModel
  var body: some View {
    ForEach(movieModel.movie.similarMovies, id: \.self) { similarMovie in
      HomeSimilarMovieDetailsView(similarMovie: similarMovie)
    }
  }
}

struct HomeSimilarMovieDetailsView: View {
  
  @EnvironmentObject var movieModel: MovieModel
  var similarMovie: SimilarMovie
  
  var body: some View {
    HStack {
      Image(systemName: "").data(url: URL(string: "\(API.imageURL)\(similarMovie.image)")!)
        .resizable()
        .scaledToFill()
        .frame(maxWidth: 88, idealHeight: 120)
        .clipped()
      
      VStack(alignment: .leading, spacing: 4) {
        Text(similarMovie.name)
          .font(.title3)
          .bold()
        HStack {
          Text(movieModel.convertStringInDataFormatAndReturnYear(similarMovie))
            .padding(.trailing, 8)
          HStack(spacing: 0) {
            ForEach(0..<similarMovie.genreString.count, id: \.self) { i in
              
              Text("\(similarMovie.genreString.count)")
              
              Text("\(similarMovie.genreString[i])")
              
              if i != similarMovie.genreString.count - 1 {
                Text(", ")
              }
              
            }
          }
        }.foregroundColor(.white.opacity(0.7))
      }.padding(.leading)
    }
  }
}

struct HomeSimilarMoviesView_Previews: PreviewProvider {
  static var previews: some View {
    HomeSimilarMoviesView()
  }
}
