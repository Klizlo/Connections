//  ContentView.swift
//  Connections
//
//  Created by student on 12/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    typealias Tile = ConnectionModel.Tile
    
    @ObservedObject var viewModel: ConnectionViewModel
    
    var body: some View {
        VStack {
            Text("Connections")
                .font(.system(size: 40))
            groups
            tiles
                .animation(.default, value: viewModel.tiles)
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
                withAnimation {
                    viewModel.checkTilesGroup()
                } completion: { 
                    var groupedTiles = viewModel.tiles.filter({$0.isMatched && $0.isSelected})
                    if let groupToShow = viewModel.groupedTiles.first(where: {$0.name == groupedTiles.first!.group}) {
                        viewModel.showGroupedTiles(groupedTiles: groupToShow)
                    }
                    groupedTiles.forEach({viewModel.unselect(tile: $0)})
                }
            }, label: {
                Text("Submit")
            })
            Spacer()
        }
    }
    
    var tiles: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 0)], spacing: 0) {
            ForEach(viewModel.tiles) { tile in
                if !tile.isMatched || tile.isSelected {
                    TileView(tile: tile)
                        .aspectRatio(3/1, contentMode: .fill)
                        .padding(5)
                        .onTapGesture {
                            viewModel.select(tile: tile)
                        }
                        .transition(.scale)
                        .opacity(tile.isMatched ? 0 : 1)
                        .scaleEffect(tile.isMatched ? 0.5 : 1)
                        .rotation3DEffect(
                            .degrees(tile.isMatched ? 360 : 0),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                        .rotation3DEffect(
                            .degrees(tile.isMatched ? -180 : 0),                            axis: (x: 0.0, y: 0.0, z: 1.0)
                        )
                }
            }
        }
    }
    
    var groups: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 280), spacing: 0)], spacing: 0) {
            ForEach(viewModel.groupedTiles) { groupTiles in
                if groupTiles.isVisible {
                    ThemeGroupView(groupedTiles: groupTiles)
                        .aspectRatio(6/1, contentMode: .fill)
                }
            }
        }
    }
}

#Preview {
    ContentView(viewModel: ConnectionViewModel())
}
