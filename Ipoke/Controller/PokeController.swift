//
//  PokeController.swift
//  Ipoke
//
//  Created by user226765 on 9/27/22.
//

import Foundation;

class PokeController: ObservableObject {
    @Published var resultData: [PokeResultModel] = [];
    
    init() {
        findAll()
    }
    
    func findAll(offset: Int = 0) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=10&offset=\(offset)") else {
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
                } catch {
                    return print("Error in Get Data Request: \(error)")
                    
                }
                
            }
            
        }.resume()
    }
}
