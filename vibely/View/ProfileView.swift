//
//  ProfileView.swift
//  vibely
//
//  Created by Robert on 19/03/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button(action: {authModel.signOut()}, label: {
                Text("Sign Out")
                    .bold()
            })
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
