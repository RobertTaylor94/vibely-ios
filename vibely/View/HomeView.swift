//
//  HomeView.swift
//  vibely
//
//  Created by Robert on 19/03/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        TabView {
            FeedView()
                .tabItem{
                    Label("Feed", systemImage: "newspaper.circle")}
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle.fill")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
