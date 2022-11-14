//
//  MainView.swift
//  RandomNumber
//
//  Created by Aleksandar Drakaliyski on 14/10/2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
        ContentView()
            .tabItem {
                Label("Numbers", systemImage: "number.square.fill")
            }
        
        RandomNameView()
            .tabItem {
                Label("Names", systemImage: "person.2.circle.fill")
            }
            
            AddressView()
                .tabItem {
                    Label("Address", systemImage: "house.fill")
            }
            
            ColourView()
            .tabItem {
                Label("Colour", systemImage: "paintpalette.fill")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
