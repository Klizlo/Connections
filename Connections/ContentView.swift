//
//  ContentView.swift
//  Connections
//
//  Created by student on 12/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ConnectionViewModel
    
    var body: some View {
        VStack {
            Text("Connections")
                .font(.system(size: 40))
            tiles
        }
        .padding()
    }
    
    var tiles: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 0)], spacing: 0) {
            ForEach(viewModel.tiles) { tile in
                TileView(tile: tile)
                    .aspectRatio(2/1, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .padding(5)
            }
        }
    }
}

#Preview {
    ContentView(viewModel: ConnectionViewModel())
}
