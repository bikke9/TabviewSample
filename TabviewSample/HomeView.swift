//
//  HomeView.swift
//  TabviewSample
//
//  Created by 飯島啓之 on 2021/01/12.
//

import SwiftUI

struct HomeView: View {
    @Binding var isActive: Bool
    
    var body: some View {
        NavigationView {
            NavigationLink("Navigate to sub", destination: HomeSub(), isActive: $isActive)
                .navigationTitle("Home")
        }
    }
}

struct HomeSub: View {
    var body: some View {
        VStack {
            Text("Home sub")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var isActive = false
    
    static var previews: some View {
        HomeView(isActive: $isActive)
    }
}
