//
//  FeedView.swift
//  vibely
//
//  Created by Robert on 19/03/2023.
//

import SwiftUI

struct FeedView: View {
    
    @State private var selection = "Show All"
    
    var body: some View {
        ZStack {
            VStack {
                Picker("", selection: $selection) {
                    Text("Show All").tag("Show All")
                    Text("Show Followers").tag("Show Followers")
                }
                .pickerStyle(.segmented)
                .padding(50)
                Spacer()
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        // Add post
                    }) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                }
            }
        }
        
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
