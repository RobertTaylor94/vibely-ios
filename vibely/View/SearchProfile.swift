//
//  SearchProfile.swift
//  vibely
//
//  Created by Robert on 20/03/2023.
//

import SwiftUI

struct SearchProfile: View {
    
    var user: String
    var email: String
    var bio: String
    
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
        SearchProfile(user: "Murvoth", email: "text@email.com", bio: "Bio goes here")
    }
}
