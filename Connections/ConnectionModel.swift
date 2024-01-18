//
//  ConnectionModel.swift
//  Connections
//
//  Created by student on 12/12/2023.
//

import Foundation

struct ConnectionModel {
    
    private(set) var tiles: Array<Tile>
    private(set) var groupedTiles: Array<GroupedTiles>
    var lifes: Int
    static let MAX_LIFES = 4
    var gameStarted:Bool = false
    var buttonPressed:Bool = false
    init(groups: [WordGroup]) {
        self.tiles = []
        self.groupedTiles = []
        
        for group in groups {
            for i in 0...3 {
                tiles.append(Tile(text: group.words[i], group: group.name, id: "\(group.name+String(i))"))
            }
            groupedTiles.append(GroupedTiles(id: UUID(), name: group.name, words: group.words))
        }
        
        self.tiles = tiles.shuffled()
        self.lifes = ConnectionModel.MAX_LIFES
    }
    
    private var selectedTiles: [Int] = []
    
    mutating func select(tile: Tile) {
        if !tile.isMatched {
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
                let nextIndex = selectedTiles[i+1]
                if tiles[index].group != tiles[nextIndex].group {
                    lifes -= 1
                    return
                }
            }
            for index in selectedTiles {
                tiles[index].isMatched = true
            }
            selectedTiles = []
        }
    }
    
    mutating func unselect(tile: Tile) {
        if let index = tiles.firstIndex(where: {$0.id == tile.id}) {
            tiles[index].isSelected = false
        }
    }
    
    mutating func showGroupedTiles(groupTiles: GroupedTiles) {
        if let index = groupedTiles.firstIndex(where: {$0.id == groupTiles.id}) {
            groupedTiles[index].isVisible = true
        }
    }
    
    struct Tile: Equatable, Identifiable {
        
        var text: String
        var group: String
        var isSelected: Bool = false
        var isMatched: Bool = false
        
        var id: String
        
    }
    
    struct GroupedTiles: Equatable, Identifiable {
        var id: UUID
        var name: String
        var words: [String]
        var isVisible: Bool = false
    }
}
