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
    
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    
                    Text("Ipoke")
                        .frame(width: 300, height: 50)
                        .font(.system(size: 50, design: .rounded))
                        .bold()
                        .foregroundColor(Color.red)
                    List {
                        ForEach(PokeC.resultData, id: \.name) { pokemon in
                            HStack {
                                NavigationLink(destination: PokeDetail(URLGet: pokemon.url)) {
                                    Text("\(pokemon.name)")
                                }
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
