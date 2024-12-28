//
//  SeriesView.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 22/12/24.
//

import SwiftUI

struct SeriesView: View {
    
    @StateObject var viewModel = SeriesViewModel()
    @EnvironmentObject var favoriteSeries : FavoriteSeries
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                CategoryTitle(category: "Top 5 Series Today!")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.topSeries, id: \.id) { series in
                            NavigationLink(
                                destination: SeriesDetailView(series: series)
                            ) {
                                ContentViewListCell(
                                    imageURL: "https://image.tmdb.org/t/p/w500\(series.poster_path ?? "")",
                                    notLoadImage: "examplePoster",
                                    movieTitle: "\(series.name)")
                            }
                            .foregroundStyle(Color(.label))
                            
                        }
                    }
                }
                
                CategoryTitle(category: "Discover Series!")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.discoverSeries,  id: \.id) { series in
                            NavigationLink(
                                destination: SeriesDetailView(series: series)
                            ) {
                                ContentViewListCell(
                                    imageURL: "https://image.tmdb.org/t/p/w500\(series.poster_path ?? "")",
                                    notLoadImage: "examplePoster",
                                    movieTitle: "\(series.name)")
                            }
                            .foregroundStyle(Color(.label))
                            
                        }
                    }
                }
                
                CategoryTitle(category: "All Time Series!")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.allTimeSeries,  id: \.id) { series in
                            NavigationLink(
                                destination: SeriesDetailView(series: series)
                            ) {
                                ContentViewListCell(
                                    imageURL: "https://image.tmdb.org/t/p/w500\(series.poster_path ?? "")",
                                    notLoadImage: "examplePoster",
                                    movieTitle: "\(series.name)")
                            }
                            .foregroundStyle(Color(.label))
                            
                        }
                    }
                }
                
            }
            .navigationTitle("Series 🖥️")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.getTopSeries()
                viewModel.getDiscoverSeries()
                viewModel.getAllTimeSeries()
            }
        }
    }
}

#Preview {
    SeriesView()
}


//struct SeriesCategoryView: View {
//    let category: String
//    let seriesList: [any Series]
//    
//    var body: some View {
//
//        CategoryTitle(category: category)
//        ScrollView(.horizontal) {
//            HStack {
//                ForEach(seriesList, id: \.id) { series in
//                    NavigationLink(
//                        destination: SeriesDetailView(series: series)
//                    ) {
//                        ContentViewListCell(
//                            imageURL: "https://image.tmdb.org/t/p/w500\(series.poster_path ?? "")",
//                            notLoadImage: "examplePoster",
//                            movieTitle: "\(series.name)"
//                        )
//                    }
//                    .foregroundStyle(Color(.label))
//                }
//            }
//        }
//    }
//}
