//
//  Tab.swift
//  TabviewSample
//
//  Created by 飯島啓之 on 2021/01/09.
//

import SwiftUI

struct Tab: View {
    @State private var selection = 0
    
    var body: some View {
        let selectable = Binding(
            get: {
                self.selection
            }, set: {
                self.selection = $0
            })
        
        TabView(selection: selectable) {
            Text("Home")
                .tabItem { Image(systemName: "house") }
                .tag(0)
            
            Text("List")
                .tabItem { Image(systemName: "list.bullet") }
                .tag(1)
        }
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
