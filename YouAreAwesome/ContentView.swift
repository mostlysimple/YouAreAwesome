//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Johnny Hubbard on 3/15/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text("I am a Developer!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
        }
        // New Stuff Here!
        .padding()
        
    }
}

#Preview {
    ContentView()
}
