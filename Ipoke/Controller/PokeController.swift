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
    @Published var resultIndAllFetch: [PokeFetchManiplation] = [];
    
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
                    for a in self.resultData {
                        self.findAllInd(URLGet: a.url)
                        print(a.url)
                    }
                } catch {
                    return print("Error in Get Data Request: \(error)")
                    
                }
                
            }
            
        }.resume()
    }
    
    func findAllInd(URLGet: String) {
        let url = URL(string: URLGet)!
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                return print("Error in request data session: \(error!)")
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder();
                    
                    //decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let result: PokeFetchManiplation = try decoder.decode(PokeFetchManiplation.self, from: data);
                    print(result)
                    self.resultIndAllFetch.append(result)
                    
                } catch {
                    return print("Error in Get Data Request: \(error)")
                }
            }
            
        }.resume()
    }
}
