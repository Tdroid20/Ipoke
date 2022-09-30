//
//  PokeDetail.swift
//  Ipoke
//
//  Created by user226765 on 9/28/22.
//

import SwiftUI;

struct PokeDetail: View {
    
    @State var pokemon: PokeIndModel = PokeIndModel()
    var body: some View {
        VStack {
            Text("\(pokemon.name.prefix(1).uppercased()+pokemon.name.dropFirst())")
                .foregroundColor(.blue)
                .frame(width: 200, height: 50)
                .font(.system(size: 25, design: .rounded))
                .bold()
            Form() {
                Section {
                VStack {
                    AsyncImage(url: URL(string: pokemon.sprites.other.artWork.front_default)) { image in
                        image.resizable()
                        
                    } placeholder: {
                        Color(.gray)
                    }
                        
                        .frame(width: 350, height: 300, alignment: .center)
                        
                    
                        
                }
                VStack(alignment: .leading) {
                    Text("Basic Information")
                    .font(.system(.title))
                    .frame(width: 320, alignment: .center)
                    .bold()
                    .padding(.bottom)
                    HStack {
                        Text("Experience: ") +
                            Text("\(pokemon.base_experience)")
                            .foregroundColor(.blue)
                    }
                    HStack {
                        Text("Specie: ") +
                        Text("\(pokemon.species.name)")
                            .foregroundColor(.red)
                    }
                    
                }
                .bold()
                VStack(alignment: .leading) {
                        Text("Stats")
                        .font(.system(.title))
                        .frame(width: 320, alignment: .center)
                        .bold()
                    
                    
                        ForEach(pokemon.stats, id: \.stat!.name) { item in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(item.stat!.name):") + Text(" \(item.base_stat)").foregroundColor(.green)
                                    
                                    ProgressView(value: Float(item.base_stat), total: 233)
                                        .tint(Color.green)
                                        
                                }
                                HStack {
                                    Text("Effort: ") +
                                    Text("\(item.effort)")
                                        .foregroundColor(.red)
                                    
                                }
                                Spacer()
                            }
                        }
                    }
                }
            }

        }
    }
}

