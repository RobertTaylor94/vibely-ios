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
            UserSearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass.circle")}
            Group {
                if authModel.user != nil {
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.circle")}
                } else {
                    SignUpView()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
