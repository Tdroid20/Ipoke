//
//  ContentView.swift
//  Ipoke
//
//  Created by user226765 on 9/27/22.
//

import SwiftUI;

var resultInd: [PokeIndModel]?;


struct ContentView: View {
    @EnvironmentObject var PokeC: PokeController;
    
    @State var limit = 10
    @State var offset = 0
    @State var page = 1;
    
    @State private var downloadAmount = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    
                    Text("Ipokemon")
                        .frame(width: 300, height: 50)
                        .font(.system(size: 50, design: .rounded))
                        .bold()
                        .foregroundColor(Color.red)
                    if downloadAmount != 100.0 {
                        Text("Loading...")
                            .bold()
                            .font(.system(size: 20))
                        ProgressView(value: downloadAmount, total: 100).onReceive(timer) { _ in
                            if downloadAmount < 100 {
                                downloadAmount += 2
                            }
                        }
                        
                    } else {
                        
                        List {
                            ForEach(Array(PokeC.pokemons.enumerated()), id:\.offset){ index, pokemon in
                                HStack {
                                    AsyncImage(url: URL(string: pokemon.sprites.other.artWork.front_default)) { image in
                                        image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 90, height: 80)
                                    } placeholder: {
                                        Color(.gray)
                                    }
                                    .background(Color("backColor"))
                                    .cornerRadius(25)
                                    .frame(height: 80)
                                        
                                        Text("\(pokemon.name.prefix(1).uppercased()+pokemon.name.dropFirst())")
                                            .foregroundColor(.blue)
                                            .font(.system(size: 20,design: .rounded))
                                            .bold()
                                            .shadow(color: .cyan, radius: 7,x: 8,y: 8)
                                            .frame(width: 200, alignment: .trailing)
                                    
                                }.frame(width: 300, alignment: .trailing)
                            }
                        }
                    }
                        
                    }.toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            
                            
                            if(PokeC.resultDataFetch?.previous == nil) {
                                Button(action: {
                                    offset -= limit
                                    page += -1
                                    
                                    PokeC.findAll(limit: limit, offset: offset)
                                }, label: {
                                    Label("Prev", systemImage: "lessthan.circle")
                                }).disabled(true)
                            } else {
                                Button(action: {
                                    offset -= limit
                                    page += -1
                                    
                                    PokeC.findAll(limit: limit, offset: offset)
                                }, label: {
                                    Label("Prev", systemImage: "lessthan.circle")
                                })
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            if(PokeC.resultDataFetch?.next == nil) {
                                
                                Button(action: {
                                    offset += limit
                                    page += 1
                                    
                                    PokeC.findAll(limit: limit, offset: offset)
                                }, label: {
                                    Label("Next", systemImage: "greaterthan.circle")
                                }).disabled(true)
                            } else {
                                Button(action: {
                                    offset += limit
                                    page += 1
                                    
                                    PokeC.findAll(limit: limit, offset: offset)
                                }, label: {
                                    Label("Next", systemImage: "greaterthan.circle")
                                })
                            }
                        }
                        ToolbarItem(placement: .principal) {
                            HStack {
                                
                                Text("Page: \(page)/\(getTotalPages())")
                            }.bold()
                                .frame(width: 100, height: 50)
                        }
                    }
                }
        }
        .padding()
    }

    func getTotalPages () -> Int{
           let p = (1154/limit)
           
           return ( p + 1)
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
