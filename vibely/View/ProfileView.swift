//
//  ProfileView.swift
//  vibely
//
//  Created by Robert on 19/03/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
    @EnvironmentObject private var firestore: FirestoreManager
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Bio")
                        .font(.title3)
                        .padding(5)
                    Text(firestore.userData.bio)
                }.padding(10)
                ScrollView {
                    ForEach(firestore.userPosts) { item in
                        Post(user: item.displayName, post: item.post)
                    }
                }
                Spacer()
            }.onAppear {
                firestore.getCurrentUserData(uid: authModel.user!.uid)
                firestore.getUserPosts(uid: authModel.user!.uid)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading, content: {
                    Button(action: {
                        authModel.signOut()
                    }, label: {
                        Text("Sign Out")
                            .bold()
                    })
                })
                    ToolbarItem(placement: .principal, content: {
                        Text(firestore.userData.displayName)
                            .font(.headline)
                    })
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
