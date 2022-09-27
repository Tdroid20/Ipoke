//
//  ContentView.swift
//  Ipoke
//
//  Created by user226765 on 9/27/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var PokeC: PokeController;
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    
                    Text("Ipoke")
                        .font(.custom("GODOFWAR", size: 50))

                    
                    List {
                        ForEach(PokeC.resultData, id: \.name) { pokemon in
                            Text("\(pokemon.name)")
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
