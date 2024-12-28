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
    @EnvironmentObject var favoriteSeries: FavoriteSeries
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                // Hero section
                ZStack(alignment: .bottom) {
                    // Backdrop
                    SerieBlurBackground(series: series)
                    
                    // Series poster and title
                    SerieImageTitle(series: series)
                        .padding(17)
                }
                
                VStack(spacing: 15) {
                    // Rating and favorite button
                    HStack(spacing: 3) {
                        SeriesRatingView(rating: series.vote_average, voteCount: series.vote_count)
                        Spacer()
                        FavoriteButton(isFavorite: favoriteSeries.isFavorite(series: series)) {
                            if favoriteSeries.isFavorite(series: series) {
                                favoriteSeries.removeFromFavorites(series: series)
                            } else {
                                favoriteSeries.addToFavorites(series: series)
                            }
                        }
                    }
                    .padding(.top, 16)
                    
                    // Series details
                    SerieDescription(series: series)
                    
                    // Genres
                    if let genre = viewModel.seriesDetail {
                        GenresView(genres: genre.genres)
                            .padding(.top, -4)
                    }
                    
                    // Seasons
                    if let detailSeason = viewModel.seriesDetail {
                        SeasonsView(seasons: detailSeason.seasons)
                            .padding(.bottom, 20)
                    }
                }
                .padding(.horizontal)
            }
        }
        .ignoresSafeArea(edges: .top)
        .onAppear {
            viewModel.getSeriesDetail(seriesId: series.id)
        }
    }
}

struct SerieBlurBackground: View {
    let series: any Series
    
    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(series.backdrop_path ?? "")")) { image in
            image.resizable()
                .frame(height: 300)
                .blur(radius: 10)
        } placeholder: {
            Rectangle()
                .foregroundColor(.gray.opacity(0.3))
                .frame(height: 300)
                .blur(radius: 10)
        }
    }
}

struct SerieImageTitle: View {
    let series: any Series
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 16) {
            // Poster
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(series.poster_path ?? "")")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .cornerRadius(10)
                    .shadow(radius: 6)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.3))
                    .frame(width: 100, height: 150)
                    .cornerRadius(10)
            }
            
            // Title and first air date
            VStack(alignment: .leading, spacing: 6) {
                Text(series.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
                    .lineLimit(3)
                
                Text(String(series.first_air_date.prefix(4)))
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
    }
}

struct SeriesRatingView: View {
    let rating: Double
    let voteCount: Int
    
    var body: some View {
        VStack(spacing: 5) {
            HStack(spacing: 4) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text(String(format: "%.1f", rating))
                    .fontWeight(.semibold)
            }
            Text("\(voteCount) votes")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(.ultraThinMaterial)
        .cornerRadius(8)
    }
}

struct SerieDescription: View {
    let series: any Series
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Overview section
            VStack(alignment: .leading, spacing: 8) {
                Text("Overview")
                    .font(.headline)
                Text(series.overview)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            // First air date
            VStack(alignment: .leading, spacing: 6) {
                Text("First Air Date")
                    .font(.headline)
                Text(series.first_air_date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct GenresView: View {
    let genres: [SeriesDetailGenres]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Genres")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(genres) { genre in
                        Text(genre.name)
                            .font(.caption)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(.ultraThinMaterial)
                            .cornerRadius(12)
                    }
                }
            }
        }
    }
}

struct SeasonsView: View {
    let seasons: [SeriesDetailSeasons]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Seasons")
                .font(.headline)
            
            ForEach(seasons, id: \.id) { season in
                SeasonListCell(season: season)
            }
        }
    }
}

struct SeasonListCell: View {
    let season: SeriesDetailSeasons
    
    var body: some View {
        HStack(spacing: 12) {
            // Season poster
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(season.poster_path)")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 120)
                    .cornerRadius(8)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.3))
                    .frame(width: 80, height: 120)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(season.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("\(season.episode_count) episodes")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                if season.vote_average != 0 {
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.caption2)
                        Text(String(format: "%.1f", season.vote_average))
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(10)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
}

#Preview {
    SeriesDetailView(series: MockData.sampleSeries as (any Series))
        .environmentObject(FavoriteSeries())
}
