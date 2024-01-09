//
//  ConnectionModel.swift
//  Connections
//
//  Created by student on 12/12/2023.
//

import Foundation

struct ConnectionModel {
    
    private(set) var tiles: Array<Tile>
    var lifes: Int
    static let MAX_LIFES = 4
    
    init(groups: [WordGroup]) {
        self.tiles = []
        
        for group in groups {
            for i in 0...3 {
                tiles.append(Tile(text: group.words[i], group: group.name, id: "\(group.name+String(i))"))
            }
        }
        
        self.tiles = tiles.shuffled()
        self.lifes = ConnectionModel.MAX_LIFES
    }
    
    private var selectedTiles: [Int] = []
    
    mutating func select(tile: Tile) {
        if let index = tiles.firstIndex(where: {$0.id == tile.id}) {
            if selectedTiles.contains(index) {
                tiles[index].isSelected = false
                selectedTiles = selectedTiles.filter({$0 != index})
            } else if selectedTiles.count < 4 {
                tiles[index].isSelected = true
                selectedTiles.append(index)
            }
        }
    }
    
    mutating func deselectAll() {
        for index in selectedTiles {
            tiles[index].isSelected = false
        }
        selectedTiles = []
    }
    
    mutating func shuffle() {
        tiles.shuffle()
    }
    
    mutating func checkTilesGroup() {
        if selectedTiles.count == 4 {
            for i in 0...2 {
                let index = selectedTiles[i]
                if tiles[index].group != tiles[index].group {
                    lifes -= 1
                }
            }
        }
    }
    
    struct Tile: Equatable, Identifiable {
        
        var text: String
        var group: String
        var isSelected: Bool = false
        var isMatched: Bool = false
        
        var id: String
        
    }
}
