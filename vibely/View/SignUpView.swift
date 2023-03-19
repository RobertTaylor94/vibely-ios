//
//  SignUp.swift
//  vibely
//
//  Created by Robert on 17/03/2023.
//

import SwiftUI

struct SignUpView: View {
    
    @State var email = ""
    @State var password = ""
    @State private var showPassword = false
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Vibely")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 50)
                
                Text("Register")
                    .font(.title)
                
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
                    authModel.signUp(emailAddress: email, password: password)
                }) {
                    Text("Register")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                VStack {
                    Text("Already got an account?")
                        .padding(5)
                    NavigationLink(destination: LoginView(), label: {
                        Text("Sign in")
                    })
                }
                .padding(20)
                
                
                Spacer()
            }
            .padding()
        }.toolbar(.hidden)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
