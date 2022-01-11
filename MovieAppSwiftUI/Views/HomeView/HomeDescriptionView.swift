//
//  HomeDescriptionView.swift
//  MovieAppSwiftUI
//
//  Created by Giovanna Moeller on 11/01/22.
//

import SwiftUI

struct HomeDescriptionView: View {
  
  @EnvironmentObject var movieModel: MovieModel
  @State private var heartFilled: Bool = false
  
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
            Text(String(format: "%.2lf", movieModel.movie.popularity))
          }
        }
      }
      Spacer()
      Button {
        self.heartFilled.toggle()
      } label: {
        Image(systemName: heartFilled ? "suit.heart.fill" : "suit.heart")
      }
      .offset(y: 24)
    }.padding()
  }
}

struct HomeDescriptionView_Previews: PreviewProvider {
  static var previews: some View {
    HomeDescriptionView()
  }
}
