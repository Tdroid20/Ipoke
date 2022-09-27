//
//  PokeModel.swift
//  Ipoke
//
//  Created by user226765 on 9/27/22.
//

import Foundation;

struct PokeFetch: Codable {
    var count: Int = 0;
    var next: String? = "";
    var previous: String? = nil;
    var results: [PokeResultModel] = [];
}
struct PokeResultModel: Codable {
    var name: String = "Name is Not Defined"
    var url: String = "URL is Not Defined"
}
