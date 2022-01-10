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
      VStack(alignment: .leading) {
        Image("spider-man")
          .resizable()
          .scaledToFit()
        
        DescriptionView()
        
      }.foregroundColor(.white)
        
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
            Text("1.2 likes")
              .padding(.trailing, 32)
          }
          HStack {
            Image(systemName: "star.fill")
            Text("5/5 Starts")
          }
        }
      }
      Spacer()
      Image(systemName: "suit.heart.fill")
        .offset(y: 24)
    }.padding()
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
