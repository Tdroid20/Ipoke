//
//  PokeController.swift
//  Ipoke
//
//  Created by user226765 on 9/27/22.
//

import Foundation;
import SwiftUI;

class PokeController: ObservableObject {
    @Published var resultData: [PokeResultModel] = [];
    @Published var resultDataFetch: PokeFetch?;
    @Published var resultPokemonInd: PokeIndModel = PokeIndModel()
    init() {
        findAll()
    }
    
    func findAll(limit: Int = 10, offset: Int = 0) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=\(offset)") else {
            return print("URL Not Found")
        }
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                return print("Error in request data session: \(error!)")
            }
            
            if let data = data {
                do {
                    let result: PokeFetch = try JSONDecoder().decode(PokeFetch.self, from: data);
                    
                    self.resultData = result.results;
                    self.resultDataFetch = result;
                } catch {
                    return print("Error in Get Data Request: \(error)")
                    
                }
                
            }
            
        }.resume()
    }
    
    func findOne(url: String) {
        guard let PokeURl = URL(string: url) else {
            return print("URL Not Found")
        }
        URLSession.shared.dataTask(with: PokeURl) { (data, res, error) in
            if error != nil {
                return print("Error in request data session: \(error!)")
            }
            
            if let data = data {
                do {
                    let result: PokeIndModel = try JSONDecoder().decode(PokeIndModel.self, from: data);
                    self.resultPokemonInd = result;                    
                } catch {
                    return print("Error in Get Data Request: \(error)")
                    
                }
                
            }
            
        }.resume()
    }
}
