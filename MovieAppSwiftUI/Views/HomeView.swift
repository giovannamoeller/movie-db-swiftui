//
//  HomeView.swift
//  MovieAppSwiftUI
//
//  Created by Giovanna Moeller on 10/01/22.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var movieModel = MovieModel()
  
  
  var body: some View {
    
    ZStack {
      Color.black.ignoresSafeArea()
      ScrollView(showsIndicators: false) {
        LazyVStack(alignment: .leading) {
          
          Image("spider-man")
            .resizable()
            .scaledToFill()
            .mask {
              LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .top, endPoint: .bottom)
            }.frame(minHeight: 456)
          
          DescriptionView()
          
          SimilarMoviesView()
            .padding()
            
          
        }.foregroundColor(.white)
      }.edgesIgnoringSafeArea(.top)
        .environmentObject(movieModel)
      
    }
  }
}

struct DescriptionView: View {
  
  @EnvironmentObject var movieModel: MovieModel
  
  var body: some View {
    HStack(alignment: .top) {
      VStack(alignment: .leading) {
        Text(movieModel.movie.name)
          .font(.title)
          .bold()
          .padding(.bottom)
        HStack {
          HStack {
            
            Image(systemName: "suit.heart.fill")
            Text("\(movieModel.movie.numberOfLikes) likes")
              .padding(.trailing, 32)
          }
          HStack {
            Image(systemName: "star.fill")
            Text("\(movieModel.movie.popularity)")
          }
        }
      }
      Spacer()
      Image(systemName: "suit.heart.fill")
        .offset(y: 24)
    }.padding()
  }
}

struct SimilarMoviesView: View {
  @EnvironmentObject var movieModel: MovieModel
  var body: some View {
    ForEach(movieModel.movie.similarMovies, id: \.self) { similarMovie in
      SimilarMovieView(similarMovie: similarMovie)
    }
  }
}

struct SimilarMovieView: View {
  
  @EnvironmentObject var movieModel: MovieModel
  var similarMovie: SimilarMovie
  
  var body: some View {
    HStack {
      Image("spider-man")
        .resizable()
        .scaledToFill()
        .frame(maxWidth: 88, idealHeight: 120)
        .clipped()
      
      VStack(alignment: .leading, spacing: 4) {
        Text(similarMovie.name)
          .font(.title3)
          .bold()
        HStack {
          Text(movieModel.returnYearFromReleaseDate(similarMovie: similarMovie))
            .padding(.trailing, 8)
          HStack(spacing: 0) {
            ForEach(0..<similarMovie.genres.count, id: \.self) { i in
              
              Text(similarMovie.genres[i])
              
              if i != similarMovie.genres.count - 1 {
                Text(", ")
              }
              
            }
          }
        }.foregroundColor(.white.opacity(0.7))
      }.padding(.leading)
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
