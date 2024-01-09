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
            ScrollView {
                tiles
                    .animation(.default, value: viewModel.tiles)
            }
            LifeView(remainingLifes: viewModel.lifes, MAX_LIVES: viewModel.MAX_LIFES)
            gameButtons
        }
        .padding()
    }
    
    var gameButtons: some View {
        HStack{
            Spacer()
            Button(action: {
                viewModel.shuffle()
            }, label: {
                Text("Shuffle")
            })
            Spacer()
            Button(action: {
                viewModel.deselectAll()
            }, label: {
                Text("Deselect all")
            })
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Submit")
            })
            Spacer()
        }
    }
    
    var tiles: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 0)], spacing: 0) {
            ForEach(viewModel.tiles) { tile in
                TileView(tile: tile)
                    .aspectRatio(2/1, contentMode: .fill)
                    .padding(5)
                    .onTapGesture {
                        viewModel.select(tile: tile)
                    }
            }
        }
    }
}

#Preview {
    ContentView(viewModel: ConnectionViewModel())
}
