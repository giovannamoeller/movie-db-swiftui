//
//  HomeView.swift
//  MovieAppSwiftUI
//
//  Created by Giovanna Moeller on 10/01/22.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var movieModel = MovieModel()
  
  init() {
    movieModel.getMovieDetails()
  }
  
  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      ScrollView(showsIndicators: false) {
        LazyVStack(alignment: .leading) {
          
          HomeImageView()
          
          HomeDescriptionView()
          
          HomeSimilarMoviesView().padding()
          
        }.foregroundColor(.white)
      }.edgesIgnoringSafeArea(.top)
      .environmentObject(movieModel)
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
