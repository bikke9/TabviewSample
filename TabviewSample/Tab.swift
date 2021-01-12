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
    
    @StateObject private var listScrollAction = ListScrollAction()
    
    var body: some View {
        let selectable = Binding(
            get: {
                self.selection
            }, set: {
                if $0 == self.selection {
                    switch $0 {
                    case .home:
                        self.homeIsActive = false
                    case .list:
                        self.listScrollAction.action = .top
                    }
                } else {
                    self.selection = $0
                }
            })
        
        TabView(selection: selectable) {
            HomeView(isActive: $homeIsActive)
                .tabItem { Image(systemName: "house") }
                .tag(TabSelection.home)
            
            ListView(scrollAction: listScrollAction)
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
