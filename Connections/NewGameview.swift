//
//  NewGameview.swift
//  Connections
//
//  Created by Natalia Krukar on 16/01/2024.
//

import SwiftUI

struct NewGameview: View {
    @ObservedObject 
    var viewmodel:ConnectionViewModel
    var body: some View {
        VStack{
            Text("Rozpocząć nową grę?")
            Button(action: {viewmodel.startGame()}, label: {
                ZStack(){
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 75,height: 50)
                    Text("Start").foregroundStyle(.white)
                }
            })
            
        }
        
    }
}

#Preview {
    NewGameview(viewmodel: ConnectionViewModel())
}
