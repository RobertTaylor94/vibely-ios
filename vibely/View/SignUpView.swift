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
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to Vibely!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            TextField("Email", text: $email)
                .padding()
                .cornerRadius(10)
//                .padding(.bottom, 20)
            TextField("Password", text: $password)
                .padding()
                .cornerRadius(10)
//                .padding(.bottom, 20)
        }.padding(20)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
