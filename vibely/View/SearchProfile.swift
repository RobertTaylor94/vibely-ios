//
//  SearchProfile.swift
//  vibely
//
//  Created by Robert on 20/03/2023.
//

import SwiftUI

struct SearchProfile: View {
    @EnvironmentObject private var authModel: AuthViewModel
    @EnvironmentObject private var firestore: FirestoreManager
    var user: String
    var email: String
    var bio: String
    var uid: String
    
    var body: some View {
        VStack {
            Text(user)
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading, .trailing], 20)
                .padding(.bottom, 5)
            Text(email)
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.bottom, .leading, .trailing], 20)
            Text(bio)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.bottom, .leading, .trailing], 20)
            Group {
                if firestore.userData.followers.contains(uid) {
                    Text("Following")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding([.leading, .trailing, .bottom], 20)
                } else if user != "" && user != authModel.user!.displayName {
                    Button {
                        //add to followers
                        firestore.addToFollowers(uid: uid)
                    } label: {
                        Text("Follow")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding([.leading, .trailing, .bottom], 20)
                    }
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .foregroundColor(.white)
                .shadow(radius: 10)
        )
        .padding(20)
    }
}

struct SearchProfile_Previews: PreviewProvider {
    static var previews: some View {
        SearchProfile(user: "Murvoth", email: "text@email.com", bio: "Bio goes here", uid: "")
    }
}
