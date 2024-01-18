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
        WordGroup(id: UUID(), name: "Alkohol", words: ["Schnapps", "Gorzałka", "Temerska Żytnia", "Zwykły cienkusz", "Mahakamski spiryt"]),
        WordGroup(id: UUID(), name: "Planszówki", words: ["Mix tura", "Posiadłość szaleństwa", "Boss Monster", "Splendor"]),
        WordGroup(id: UUID(), name: "Metal", words: ["Symfoniczny", "Power", "Gotycki", "Folk"]),
//        WordGroup(id: UUID(), name: "Grill", words: ["G", "G", "G", "G"]),
//        WordGroup(id: UUID(), name: "Słodkości", words: ["s", "s", "s", "s"]),
        WordGroup(id: UUID(), name: "Budowle", words: ["Zamek", "Wieża", "Pałac", "Blok", "Kamienica"]),
//        WordGroup(id: UUID(), name: "Drzwi", words: ["Zamek", "Klamka", "Judasz", "Skobel", "Wkładka", "Skrzydło"]),
        WordGroup(id: UUID(), name: "Drzwi", words: ["Klamka", "Judasz", "Skobel", "Wkładka", "Skrzydło"]),
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
    var gameStarted: Bool{
        model.gameStarted
    }
    func startGame(){
        model.gameStarted.toggle()
    }
    func restartGame(){
        model=ConnectionViewModel.createGame()
    }
    var buttonPressed: Bool{
        model.buttonPressed
    }
    func pressButton(){
        model.buttonPressed.toggle()
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
