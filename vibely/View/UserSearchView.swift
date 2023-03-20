//
//  UserSearchView.swift
//  vibely
//
//  Created by Robert on 20/03/2023.
//

import SwiftUI

struct UserSearchView: View {
    
    @State var text = ""
    @EnvironmentObject private var firestore: FirestoreManager
    
    var body: some View {
        VStack {
            Text("Find your friends")
                .padding(10)
                .font(.largeTitle)
            SearchBar(text: $text)
            Divider()
            SearchProfile(user: firestore.foundUser.displayName, email: "", bio: firestore.foundUser.bio)
            Spacer()
        }
    }
}

struct UserSearchView_Previews: PreviewProvider {
    static var previews: some View {
        UserSearchView()
    }
}
