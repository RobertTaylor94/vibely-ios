//
//  FeeView.swift
//  vibely
//
//  Created by Robert on 19/03/2023.
//

import SwiftUI

struct FeedView: View {
    
    @State private var selection = "Show All"
    
    var body: some View {
        VStack {
            Picker("", selection: $selection) {
                Text("Show All").tag("Show All")
                Text("Show Followers").tag("Show Followers")
            }
            .pickerStyle(.segmented)
            Text("Hello, World!")
        }
        
    }
}

struct FeeView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
