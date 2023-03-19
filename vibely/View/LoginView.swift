//
//  LogIn.swift
//  vibely
//
//  Created by Robert on 19/03/2023.
//

import SwiftUI

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    
    @EnvironmentObject private var authModel: AuthViewModel

    var body: some View {
        VStack {
            Text("Welcome to Vibely")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 50)

            VStack(alignment: .leading) {
                Text("Email")
                    .font(.headline)
                TextField("Enter your email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 20)
                    .textInputAutocapitalization(.never)

                Text("Password")
                    .font(.headline)
                HStack {
                    Group {
                        if showPassword {
                            TextField("Enter your password", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.bottom, 20)
                                .textInputAutocapitalization(.never)
                        } else {
                            SecureField("Enter your password", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.bottom, 20)
                                .textInputAutocapitalization(.never)
                        }
                    }
                    
                    Button(action: {
                        showPassword.toggle()
                    }, label: {
                        Group {
                            if showPassword {
                                Image(systemName: "eye")
                            } else {
                                Image(systemName: "eye.slash")
                            }
                        }
                    })
                }
                
            }
            .padding()

            Button(action: {
                authModel.signIn(emailAddress: email, password: password)
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

            Spacer()
        }
        .padding()
    }
}


struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
