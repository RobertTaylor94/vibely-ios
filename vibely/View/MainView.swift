//
//  ContentView.swift
//  vibely
//
//  Created by Robert on 17/03/2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        Group {
            if authModel.user != nil {
                HomeView()
            } else {
                SignUpView()
            }
        }.onAppear {
            authModel.listenToAuthState()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
