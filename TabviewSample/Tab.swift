//
//  Tab.swift
//  TabviewSample
//
//  Created by 飯島啓之 on 2021/01/09.
//

import SwiftUI

struct Tab: View {
    @State private var selection = TabSelection.home
    
    @State private var homeIsActive = false
    
    var body: some View {
        let selectable = Binding(
            get: {
                self.selection
            }, set: {
                self.selection = $0
                
                switch self.selection {
                case .home:
                    self.homeIsActive = false
                default:
                    break
                }
            })
        
        TabView(selection: selectable) {
            HomeView(isActive: $homeIsActive)
                .tabItem { Image(systemName: "house") }
                .tag(TabSelection.home)
            
            Text("List")
                .tabItem { Image(systemName: "list.bullet") }
                .tag(TabSelection.list)
        }
    }
    
    enum TabSelection: String {
        case home
        case list
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
