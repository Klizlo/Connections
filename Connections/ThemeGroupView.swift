//
//  ThemeGroupView.swift
//  Connections
//
//  Created by Natalia Krukar on 15/01/2024.
//

import SwiftUI

struct ThemeGroupView: View {
    typealias GroupedTiles = ConnectionModel.GroupedTiles
    let groupedTiles: GroupedTiles
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 10)
        Group{
            base.fill(.pink)
                .overlay(groupView)
                    .lineLimit(nil)
                    .aspectRatio(contentMode: .fill)
                    .padding()
        }
    }
    
    var groupView: some View {
        VStack{
            Text(groupedTiles.name)
                .font(.largeTitle)
            Text(groupedTiles.words.joined(separator: ", "))
                .font(.headline)
        }
    }
}

#Preview {
    ThemeGroupView(groupedTiles: ConnectionModel.GroupedTiles(id: UUID(), name: "Ciasta", words: ["Babka", "Sernik", "Szarlotka", "Makowiec"]))
}
