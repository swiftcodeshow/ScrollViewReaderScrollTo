//
//  ContentView.swift
//  ScrollViewReaderScrollTo
//
//  Created by 米国梁 on 2021/4/26.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID().uuidString
    var name: String
}

let items: [Item] = [
    Item(name: "Kevin"),
    Item(name: "Cary"),
    Item(name: "Yilia"),
    Item(name: "Lora"),
    Item(name: "Anastasia"),
    Item(name: "Rachel"),
    Item(name: "Jane"),
    Item(name: "Tina"),
    Item(name: "Olivia"),
    Item(name: "Helen")
]

struct ContentView: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            ScrollViewReader { proxy in
                
                HStack {
                    ForEach(items) { item in
                        
                        Button(item.name) {
                            
                            withAnimation {
                                
                                proxy.scrollTo(item.id, anchor: .leading)
                            }
                        }
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        // Here must be id, NOT tag
                        .id(item.id)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
