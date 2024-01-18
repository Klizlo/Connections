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
            base.fill(.yellow)
                .overlay(groupView)
//                    .lineLimit(nil)
//                    .aspectRatio(contentMode: .fill)
                .padding(0.9)
        }
    }
    
    var groupView: some View {
        VStack{
            Text("\(groupedTiles.name): \(groupedTiles.words.joined(separator: ", "))")
                .font(.subheadline)
        }
    }
}

#Preview {
    ThemeGroupView(groupedTiles: ConnectionModel.GroupedTiles(id: UUID(), name: "Ciasta", words: ["Babka", "Sernik", "Szarlotka", "Makowiec"]))
}
