//
//  SeriesDetailViewModel.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 26/12/24.
//

import Foundation

final class SeriesDetailViewModel: ObservableObject {
    
    @Published var seriesDetail : SeriesDetailModel?
    
    
    func getSeriesDetail(seriesId: Int) {
        NetworkManager.shared.getNetworkCall(
            fetchFunction: { completion in
                NetworkManager.shared.fetchSeriesDetails(seriesId: seriesId, completed: completion)
            },
            saveData: { seriesDetail in
                DispatchQueue.main.async {
                    self.seriesDetail = seriesDetail
                }
            }
        )
    }
}
