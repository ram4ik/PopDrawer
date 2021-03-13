//
//  ContentView.swift
//  PopDrawer
//
//  Created by Ramill Ibragimov on 13.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selected: String = "Select"
    @State private var show: Bool = false
    
    var body: some View {
        ZStack {
            Button(action: {
                show.toggle()
            }, label: {
                Text(selected)
                    .font(.largeTitle)
            })
            
            PopUpView(show: $show, selected: $selected)
                .edgesIgnoringSafeArea(.all)
                .offset(y: show ? 0 : UIScreen.main.bounds.height)
                .animation(.easeInOut)
        }
    }
}

struct PopUpView: View {
    @Binding var show: Bool
    @Binding var selected: String
    
    var buttons = ["One", "Two", "Three", "Four", "Five"]

    var body: some View {
        ZStack {
            Color.secondary.opacity(0.1)
            VStack {
                Spacer()
                List {
                    ForEach(buttons, id: \.self) { button in
                        Button(action: {
                            selected = button
                            show.toggle()
                        }, label: {
                            Text(button)
                        })
                    }
                }.frame(height: 240)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
