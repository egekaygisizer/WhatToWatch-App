//
//  SeriesView.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 22/12/24.
//

import SwiftUI

struct SeriesView: View {
    
    @StateObject var viewModel = SeriesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                CategoryTitle(category: "Top 5 Series!")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.topSeries) { series in
                            ContentViewListCell(imageURL: "https://image.tmdb.org/t/p/w500\(series.poster_path ?? "")", notLoadImage: "examplePoster", movieTitle: "\(series.name)")
                            
                        }
                    }
                }
                
                CategoryTitle(category: "Discover Series!")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.discoverSeries) { series in
                            ContentViewListCell(imageURL: "https://image.tmdb.org/t/p/w500\(series.poster_path ?? "")", notLoadImage: "examplePoster", movieTitle: "\(series.name)")
                            
                        }
                    }
                }
            }
            .navigationTitle("Series 🖥️")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.getTopSeries()
                viewModel.getDiscoverSeries()
            }
        }
    }
}

#Preview {
    SeriesView()
}


