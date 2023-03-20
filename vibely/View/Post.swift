//
//  Post.swift
//  vibely
//
//  Created by Robert on 20/03/2023.
//

import SwiftUI

struct Post: View {
    
    var user: String
    var post: String
    
    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 20, style: .continuous)
//                .fill(.white)
//                .shadow(radius: 20)
            VStack {
                Text(user)
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(10)
                Text(post)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(10)
                HStack {
                    Button {
                        //A definite vibe
                    } label: {
                        Image(systemName: "hand.thumbsup")
                    }
                    .padding(10)
                    Button {
                        //Not a vibe
                    } label: {
                        Image(systemName: "hand.thumbsdown")
                    }
                    .padding(10)
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
            )
            .padding(20)
//        }
        
    }
}

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        Post(user: "Murvoth", post: "Hurtling down Todorka at 30mph. Eeek!")
    }
}
