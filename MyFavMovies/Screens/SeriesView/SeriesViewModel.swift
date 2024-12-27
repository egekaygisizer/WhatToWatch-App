//
//  SeriesViewModel.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 25/12/24.
//

import Foundation

final class SeriesViewModel: ObservableObject {
    
    @Published var topSeries: [TopSeries] = []
    @Published var discoverSeries: [DiscoverSeries] = []
    @Published var allTimeSeries: [AllTimeSeries] = []
    @Published var seriesDetail : [SeriesDetailModel] = []

    
    func getTopSeries() {
        NetworkManager.shared.getNetworkCall(fetchFunction: NetworkManager.shared.fetchTopSeries) { topSeries in
            self.topSeries = Array(topSeries.prefix(5))
        }
    }
    func getDiscoverSeries() {
        NetworkManager.shared.getNetworkCall(fetchFunction: NetworkManager.shared.fetchDiscoverSeries) { discoverSeries in
            self.discoverSeries = discoverSeries
        }
    }
    
    func getAllTimeSeries() {
        NetworkManager.shared.getNetworkCall(fetchFunction: NetworkManager.shared.fetchAllTimeSeries) { allTimeSeries in
            self.allTimeSeries = allTimeSeries
        }
    }

    
}
