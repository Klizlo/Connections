//
//  ConnectionViewModel.swift
//  Connections
//
//  Created by student on 12/12/2023.
//

import Foundation

class ConnectionViewModel : ObservableObject {
    
    typealias Tile = ConnectionModel.Tile
    
    @Published private var model: ConnectionModel = createGame()
    
//    private static let groups = [
//        "Ksywki": ["Ptyś", "Kiciuś", "Ponczuś", "Słodziontko"],
//        "Planszówki": ["Mix tura", "Posiadłość szaleństwa", "Boss Monster", "Splendor"],
//        "Metal": ["Symphonic", "Power", "Death", "Folk"],
//        "Grill": ["Skarpetki", "Majster", "Ogień", "Pijany Szwagier"],
//        "Pierwsze spotkanie": ["żelki", "meble", "noski noski", "jednorożec"],
//        "Wykwintne danie": ["boczuś", "biała kiełbaska z futerkiem", "pstrąg temczowy", "skóra z kuraka z roszołu"],
//        "Moja Ukochana Dziewczyna": ["duck", "peace", "knife", "option"],
//        "Na pewno nie Krzyś": ["agent", "przewrót", "kur", "kaczki"]]
//    ]
    
    private static let groups = [
        WordGroup(id: UUID(), name: "Ksywki", words: ["Ptyś", "Kiciuś", "Ponczuś", "Słodziontko"]),
        WordGroup(id: UUID(), name: "Planszówki", words: ["Mix tura", "Posiadłość szaleństwa", "Boss Monster", "Splendor"]),
        WordGroup(id: UUID(), name: "Metal", words: ["Symphonic", "Power", "Death", "Folk"]),
        WordGroup(id: UUID(), name: "Grill", words: ["Skarpetki", "Majster", "Ogień", "Pijany Szwagier"]),
        WordGroup(id: UUID(), name: "Słodkość", words: ["żelki", "meble", "noski noski", "jednorożec"])
    ]
    
    private static func createGame() -> ConnectionModel {
        
        let gameGroups = Array(groups.shuffled()[...3])
        
        return ConnectionModel(groups: gameGroups)
    }
    
    var tiles : [Tile] {
        model.tiles
    }
    
}
