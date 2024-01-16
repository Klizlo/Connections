//
//  ConnectionViewModel.swift
//  Connections
//
//  Created by student on 12/12/2023.
//

import Foundation

class ConnectionViewModel : ObservableObject {
    
    typealias Tile = ConnectionModel.Tile
    typealias GroupedTiles = ConnectionModel.GroupedTiles
    
    @Published private var model: ConnectionModel = createGame()
    
    private static let groups = [
        WordGroup(id: UUID(), name: "Ksywki", words: ["p", "p", "p", "p"]),
        WordGroup(id: UUID(), name: "Planszówki", words: ["Mix tura", "Posiadłość szaleństwa", "Boss Monster", "Splendor"]),
        WordGroup(id: UUID(), name: "Metal", words: ["Symfoniczny", "Power", "Gotycki", "Folk"]),
        WordGroup(id: UUID(), name: "Grill", words: ["g", "g", "g", "g"]),
        WordGroup(id: UUID(), name: "Słodkość", words: ["żelki", "meble", "noski noski", "jednorożec"]),
//        WordGroup(id: UUID(), name: "Budowle", words: ["Zamek", "Wieża", "Pałac", "Blok", "Kamienica", "Łuk"]),
//        WordGroup(id: UUID(), name: "Drzwi", words: ["Zamek", "Klamka", "Judasz", "Skobel", "Wkładka", "Skrzydło"]),
//        WordGroup(id: UUID(), name: "Broń dystansowa", words: ["Łuk", "Klamka", ""]),
//        WordGroup(id: UUID(), name: "Anatomia ptaka", words: ["Pióro", "Skrzydło", "Dziób", "Grzebień", "Kości"]),
//        WordGroup(id: UUID(), name: "", words: [""])
    ]
    
    private static func createGame() -> ConnectionModel {
        
        let gameGroups = Array(groups.shuffled()[...3])
        
        return ConnectionModel(groups: gameGroups)
    }
    
    var lifes : Int {
        model.lifes
    }
    
    var MAX_LIFES : Int {
        ConnectionModel.MAX_LIFES
    }
    
    var tiles : [Tile] {
        model.tiles
    }
    
    var groupedTiles : [GroupedTiles] {
        model.groupedTiles
    }
    
    func select(tile: Tile) {
        model.select(tile: tile)
    }
    
    func deselectAll() {
        model.deselectAll()
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func unselect(tile: Tile) {
        model.unselect(tile: tile)
    }
    
    func showGroupedTiles(groupedTiles: GroupedTiles) {
        model.showGroupedTiles(groupTiles: groupedTiles)
    }
    
    func checkTilesGroup() {
        model.checkTilesGroup()
    }
    
}
