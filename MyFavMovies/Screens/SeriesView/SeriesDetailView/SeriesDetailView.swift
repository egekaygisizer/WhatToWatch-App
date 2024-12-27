//
//  SeriesDetailView.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 25/12/24.
//

import SwiftUI

struct SeriesDetailView: View {
    let series: any Series
    @StateObject var viewModel = SeriesDetailViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ZStack(alignment: .center) {
                // Blurry Background Image
                SerieBlurBackground(series: series)
                
                // Serie image and title
                SerieImageTitle(series: series)
            }
            
            ScrollView {
                // Serie overview, rating, release date
                SerieDescription(series: series)
                
                FavoriteButton()
                    .padding()
                
                
                
                if let detailSeason = viewModel.seriesDetail {
                    VStack(alignment: .leading) {
                        Text("Seasons")
                            .padding(.top, 10)
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(width: UIScreen.main.bounds.width - 40)
                        
                        ForEach(detailSeason.seasons, id: \.id) { season in
                            SeasonListCell(season: season)
                        }
                    }
                    
                }
                
                
            }
            
        }
        .onAppear {
            viewModel.getSeriesDetail(seriesId: series.id)
        }
    }
}
    

#Preview {
    SeriesDetailView(series: MockData.sampleSeries as (any Series))
}

struct SerieBlurBackground: View {
    let series: any Series
    
    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(series.backdrop_path ?? "")")) { image in
            image.resizable()
                .blur(radius: 25)
                .ignoresSafeArea()
                .frame(height: 370)
        } placeholder: {
            Rectangle()
                .foregroundColor(.gray)
                .blur(radius: 25)
                .ignoresSafeArea()
                .frame(height: 370)
        }
    }
}

struct SerieImageTitle: View {
    let series: any Series
    
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(series.poster_path ?? "")")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 270)
                    .cornerRadius(10)
            } placeholder: {
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 270)
                    .cornerRadius(10)
                    .foregroundColor(.gray)
            }
            
            Text(series.name)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .foregroundColor(.white)
                .shadow(radius: 5) // Başlığın okunabilirliği için gölge ekledim.
        }
    }
}

struct SerieDescription: View {
    let series: any Series
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(series.overview)
                .font(.body)
                .multilineTextAlignment(.leading)
            
            HStack(spacing: 8) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                
                HStack(alignment: .bottom) {
                    Text("\(series.vote_average, specifier: "%.1f")")
                        .font(.headline)
                    Text("(\(series.vote_count))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 2)
                }
                
            }
            
            Text("Release Date: \(series.first_air_date)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
    
}

struct SeasonListCell: View {
    let season: SeriesDetailSeasons
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(season.poster_path)")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .cornerRadius(8)
            } placeholder: {
                Rectangle()
                    .frame(width: 100, height: 150)
                    .foregroundColor(.gray)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(season.name)
                    .font(.headline)
                Text("Episodes: \(season.episode_count)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            if season.vote_average != 0 {
                HStack() {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("\(season.vote_average, specifier: "%.1f")")
                        .font(.headline)
                    
                }.padding(20)
            }
        }
        .padding(8)
    }
}
