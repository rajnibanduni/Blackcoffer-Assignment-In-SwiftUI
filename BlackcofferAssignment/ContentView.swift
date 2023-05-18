//
//  ContentView.swift
//  BlackcofferAssignment
//
//  Created by Rajni Banduni on 18/05/23.
//

import SwiftUI
//import WebKit

struct ContentView: View {
    @State private var tabSelection = 1
    
    var body: some View {
//        LocationProgressView()
        TabView(selection: $tabSelection){
            RefineView()
                .tag(1)

            ExploreView()
                .tag(2)

            Text("Network")
                .tag(3)
            Text("Chat")
                .tag(4)
            Text("Contacts")
                .tag(5)

        }
        .overlay(alignment:.bottom){
            BottomTabView(tabSelection: $tabSelection)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


