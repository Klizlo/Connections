//
//  LivesView.swift
//  Connections
//
//  Created by student on 09/01/2024.
//

import SwiftUI

struct LifeView: View {
    var remainingLifes: Int
    let MAX_LIVES: Int
    
    var body: some View {
        HStack {
            Text("Remaining attempts:")
            lifes
            lostLifes
        }
    }
    
    var lifes: some View {
        ForEach(0..<remainingLifes, id: \.self) { _ in
            Circle()
                .foregroundStyle(.red)
                .frame(width: 10, height: 10)
        }
    }
    
    var lostLifes: some View {
        ForEach(0..<(MAX_LIVES - remainingLifes), id: \.self) { _ in
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 10)
        }
    }
}

#Preview {
    LifeView(remainingLifes: 4, MAX_LIVES: 4)
}
