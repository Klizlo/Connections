//
//  ConnectionModel.swift
//  Connections
//
//  Created by student on 12/12/2023.
//

import Foundation

struct ConnectionModel {
    
    private(set) var tiles: Array<Tile>
    
    init(groups: [WordGroup]) {
        self.tiles = []
        
        for group in groups {
            for i in 0...3 {
                tiles.append(Tile(text: group.words[i], group: group.name, id: "\(group.name+String(i))"))
            }
        }
        
        self.tiles = tiles.shuffled()
    }
    
    struct Tile: Equatable, Identifiable {
        
        var text: String
        var group: String
        var isSelected: Bool = false
        var isMatched: Bool = false
        
        var id: String
        
    }
}
