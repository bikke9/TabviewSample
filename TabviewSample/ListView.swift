//
//  ListView.swift
//  TabviewSample
//
//  Created by 飯島啓之 on 2021/01/12.
//

import SwiftUI

struct ListView: View {
    let items = (0 ..< 100).map { $0 }
    
    @ObservedObject var scrollAction: ListScrollAction
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.scrollAction.action = .top
                }, label: {
                    Image(systemName: "arrow.up.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                })
                .padding(.horizontal)
                
                Button(action: {
                    self.scrollAction.action = .bottom
                }, label: {
                    Image(systemName: "arrow.down.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                })
                .padding(.horizontal)
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(items, id: \.self) { item in
                        VStack(alignment: .leading) {
                            Text("Item \(item)")
                                .padding(.horizontal)
                            Divider()
                        }
                    }
                    .onReceive(scrollAction.$action, perform: { action in
                        switch action {
                        case .top:
                            guard let top = items.first else { break }
                            withAnimation {
                                proxy.scrollTo(top, anchor: .top)
                            }
                            self.scrollAction.action = nil
                        case .bottom:
                            guard let bottom = items.last else { break }
                            withAnimation {
                                proxy.scrollTo(bottom, anchor: .bottom)
                            }
                            self.scrollAction.action = nil
                        default:
                            break
                        }
                    })
                }
            }
        }
    }
}

class ListScrollAction: ObservableObject {
    enum Action {
        case top, bottom
    }
    
    @Published var action: Action? = nil
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(scrollAction: ListScrollAction())
    }
}
