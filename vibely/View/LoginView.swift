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

                Text("Password")
                    .font(.headline)
                SecureField("Enter your password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 20)
            }
            .padding()

            Button(action: {
                // Perform login action here
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
