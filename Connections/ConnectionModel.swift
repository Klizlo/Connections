//
//  ConnectionModel.swift
//  Connections
//
//  Created by student on 12/12/2023.
//

import Foundation

struct ConnectionModel {
    
    private(set) var tiles: Array<Tile>
    
    init(tileFactory: (Int) -> (String, String)) {
        self.tiles = []
        
        for index in 0..<16 {
            let content = tileFactory(index)
            tiles.append(Tile(text: content.0, group: content.1, id: index))
        }
    }
    
    struct Tile: Equatable, Identifiable {
        
        var text: String
        var group: String
        var isSelected: Bool = false
        var isMatched: Bool = false
        
        var id: Int
        
    }
}
