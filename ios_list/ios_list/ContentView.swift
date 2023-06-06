//
//  ContentView.swift
//  ios_list
//
//  Created by Maciej Sroczek on 06/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var filter = false
    
    var body: some View {
        let listGen = Array(0...10000)
        
        let list = filter ? listGen.filter{ $0 % 6 == 0} : listGen
        
        NavigationStack {
            VStack {
                    Toggle("Filter", isOn: $filter)
                        .padding()
                    
                    
                    List(list, id: \.self) { index in
                        Text("List item #\(index)")
                    }
                    .listStyle(PlainListStyle())
                }
            .navigationBarTitle(Text("Research scenario #1"))
        }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
