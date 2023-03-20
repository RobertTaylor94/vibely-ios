//
//  CompleteProfileView.swift
//  vibely
//
//  Created by Robert on 19/03/2023.
//

import SwiftUI

struct CompleteProfileView: View {
    
    @State var displayName = ""
    @State var bio = ""
    @Binding var email: String
    @Binding var password: String
    
    @EnvironmentObject private var fireStore: FirestoreManager
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Complete your profile!")
                    .font(.largeTitle)
                    .padding(.bottom, 50)
                VStack {
                    Text("Enter your display name:")
                        .font(.headline)
                    TextField("Display name", text: $displayName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 20)
                        .textInputAutocapitalization(.never)
                    Text("Enter your bio:")
                        .font(.headline)
                    TextField("Bio", text: $bio)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 20)
                        .textInputAutocapitalization(.never)
                    
//                    NavigationLink(destination: HomeView(), label: {
                        Button(action: {
                            authModel.signUp(emailAddress: email, password: password, displayName: displayName, bio: bio)
                        }, label: {
                            Text("Complete Profile")
                        })
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
//                    })
                    Spacer()
                }
            }.padding()
        }
        
    }
}

//struct CompleteProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompleteProfileView()
//    }
//}
