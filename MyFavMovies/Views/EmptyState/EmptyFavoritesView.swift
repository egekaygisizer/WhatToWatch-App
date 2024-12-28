//
//  EmptyFavoritesView.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 27/12/24.
//

import SwiftUI

struct EmptyFavoritesView: View {
    
    @EnvironmentObject var tabSelection: TabSelection
    
    var body: some View {
        VStack {
            Image("emptyStateIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text("No Favorite Movies or Series")
                .font(.title)
                .bold()
                .padding()
                .foregroundStyle(.secondary)
            Text("You haven't marked any favorite")
                .font(.title3)
                .fontWeight(.medium)
                .padding(.bottom, 50)
                .foregroundStyle(.gray)
            Button {
                tabSelection.selectedTab = 0
            } label : {
                Text("Go to Movie List")
                    .frame(width: 220, height: 50)
                    .bold()
            }.buttonStyle(.bordered)
                .tint(Color("brandPrimary"))
            
            
        }
    }
}

#Preview {
    EmptyFavoritesView()
        .environmentObject(TabSelection())
}





