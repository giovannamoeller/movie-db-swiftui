//
//  HomeView.swift
//  MovieAppSwiftUI
//
//  Created by Giovanna Moeller on 10/01/22.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      ScrollView(showsIndicators: false) {
        VStack(alignment: .leading) {
          
          Image("spider-man")
            .resizable()
            .scaledToFill()
          
          DescriptionView()
          
          SimilarMoviesView()
            .padding()
            
          
        }.foregroundColor(.white)
      }.edgesIgnoringSafeArea(.top)
      
      
      
    }
  }
}

struct DescriptionView: View {
  var body: some View {
    HStack(alignment: .top) {
      VStack(alignment: .leading) {
        Text("Spider Man - No Way Home")
          .font(.title)
          .bold()
          .padding(.bottom)
        HStack {
          HStack {
            Image(systemName: "suit.heart.fill")
            Text("1.2K likes")
              .padding(.trailing, 32)
          }
          HStack {
            Image(systemName: "star.fill")
            Text("5 Stars")
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
  var body: some View {
    ForEach(1...5, id: \.self) {_ in
      SimilarMovieView()
    }
  }
}

struct SimilarMovieView: View {
  var body: some View {
    HStack {
      Image("spider-man")
        .resizable()
        .scaledToFill()
        .frame(maxWidth: 88, idealHeight: 120)
        .clipped()
      
      VStack(alignment: .leading, spacing: 4) {
        Text("Spider Man")
          .font(.title3)
          .bold()
        HStack {
          Text("2021")
            .padding(.trailing, 8)
          Text("Action")
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
