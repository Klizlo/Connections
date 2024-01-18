//
//  PlusButton.swift
//  Connections
//
//  Created by Natalia Krukar on 16/01/2024.
//

import SwiftUI

struct PlusButton: View {
    @ObservedObject
    var viewmodel: ConnectionViewModel
    var body: some View {
        VStack{
                Button(action:{viewmodel.pressButton()},label: {
                    ZStack{
                RoundedRectangle(cornerRadius: 100)
                    .frame(width: 50,height: 50)
                Text("✚").foregroundStyle(.white)
                }
                       })
            Button(action: {viewmodel.restartGame()}, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 12).frame(width: 100,height: 50)
                    Text("Reset Game").foregroundStyle(.white)
                }
            }).opacity(viewmodel.buttonPressed ? 1:0)
        }
    }
}

#Preview {
    PlusButton(viewmodel: ConnectionViewModel())
}
