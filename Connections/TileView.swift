//
//  TileView.swift
//  Connections
//
//  Created by student on 12/12/2023.
//

import SwiftUI

struct TileView: View {
    
    typealias Tile = ConnectionModel.Tile
    
    let tile: Tile
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 10)
        Group{
            base.fill(.purple)
                .overlay(Text(tile.text)
                    .lineLimit(nil)
                    .aspectRatio(contentMode: .fill)
                    .padding())
        }
        
    }
}

#Preview {
    TileView(tile: ConnectionModel.Tile(text: "Strucel naindhabdbabdhadbhjabab", group: "Ciasto", id: "Ciasto0"))
}
